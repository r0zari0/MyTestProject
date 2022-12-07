//
//  RecipeDetailsVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/18/22.
//

import UIKit

// MARK: - RecipeDetailsVC

class RecipeDetailsVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var ingredientImageView: ImageView!
    
    @IBOutlet private weak var caloriesLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    @IBOutlet private weak var ingredientsTableView: UITableView!
    
    // MARK: - Properties
    
    private let presenter: RecipeDetailsPresenterProtocol
    
    private let cellIdentifier: String = String(describing: "IngredientsTableViewCell")
    
    // MARK: - Init
    
    init(presenter: RecipeDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
    func setupTableView() {
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        ingredientsTableView.register(.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
}

// MARK: - Extension

extension RecipeDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.recipe.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! IngredientsTableViewCell
        
        let ingredient = presenter.recipe.ingredients[indexPath.row]
        cell.config(with: ingredient)
        
        return cell
    }
}

extension RecipeDetailsVC {
    
    private func setupUI() {
        ingredientImageView.layer.cornerRadius = ingredientImageView.bounds.width / 8
        
        ingredientImageView.fetchImage(from: presenter.recipe.image)
        
        navigationItem.largeTitleDisplayMode = .never
        
        caloriesLabel.text = "Calories: \(Int(presenter.recipe.calories)) cal"
        weightLabel.text = "Weight: \(Int(presenter.recipe.totalWeight)) grams"
        timeLabel.text = "Time: \(Int(presenter.recipe.totalTime)) min"
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let button = UIButton()
        button.tintColor = .red
        button.setTitle("Full Recipe", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.cornerRadius = 6
        
        return button
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
}
