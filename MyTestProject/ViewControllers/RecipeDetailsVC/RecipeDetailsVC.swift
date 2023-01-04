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
    
    private var presenter: RecipeDetailsPresenterProtocol
    
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
    
    func createRightBurButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: presenter.isFavorite ? "tabBarHeartSelected" :"tabBarHeart"), style: .done, target: self, action: #selector(addTapped))
    }
    
    @objc
    func addTapped(){
        presenter.isFavorite.toggle()
        createRightBurButton()
        presenter.saveRecipeInDataBase()
    }
}

// MARK: - Extension

extension RecipeDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.detailedRecipe.ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! IngredientsTableViewCell
        
        let ingredient = presenter.detailedRecipe.ingredients[indexPath.row]
        cell.config(with: ingredient)
        
        return cell
    }
}

extension RecipeDetailsVC {
    
    private func setupUI() {
        createRightBurButton()
        
        ingredientImageView.layer.cornerRadius = ingredientImageView.bounds.width / 8
        
        ingredientImageView.fetchImage(from: presenter.detailedRecipe.image)
        
        navigationItem.largeTitleDisplayMode = .never
        
        caloriesLabel.text = "Calories: \(Int(presenter.detailedRecipe.calories)) cal"
        weightLabel.text = "Weight: \(Int(presenter.detailedRecipe.totalWeight)) grams"
        timeLabel.text = "Time: \(Int(presenter.detailedRecipe.totalTime)) min"
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonColor")
        button.tintColor = .red
        button.setTitle("Full Recipe", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 6
        
        return button
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 44
    }
}
