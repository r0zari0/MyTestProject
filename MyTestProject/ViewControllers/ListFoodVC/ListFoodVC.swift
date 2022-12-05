//
//  ListFoodVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/15/22.
//

import UIKit

// MARK: - Protocol

protocol ListFoodVCProtocol: AnyObject {
    func reload()
    func setupTitle(title: String)
}

// MARK: - ListFoodVC

class ListFoodVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let presenter: ListFoodPresenterProtocol
    
    private let cellIdentifier: String = String(describing: "ListFoodCell")
    
    // MARK: - Init
    
    init(presenter: ListFoodPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.getRecipes()
    }
    
}

    // MARK: - Extension
extension ListFoodVC {
    func setupUI() {
        setupTableView()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(.init(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
}

extension ListFoodVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showRecipeDetailVC(with: presenter.foodRecipes[indexPath.row].recipe, view: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.foodRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ListFoodCell
        
        let foodRecipes = presenter.foodRecipes[indexPath.row]
        cell.config(with: foodRecipes.recipe)
        
        return cell
    }
}

extension ListFoodVC: ListFoodVCProtocol {
    func setupTitle(title: String) {
        navigationItem.title = title
    }
    
    func reload() {
        tableView.reloadData()
    }
}

