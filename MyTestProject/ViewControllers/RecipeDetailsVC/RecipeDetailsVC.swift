//
//  RecipeDetailsVC.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/18/22.
//

import UIKit

//MARK: - RecipeDetailsVC

class RecipeDetailsVC: UIViewController {
    
    //MARK: - IBOutlets
    
    //MARK: - Properties
    
    var presenter: RecipeDetailsPresenterProtocol
    
    //MARK: - Init
    
    init(presenter: RecipeDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
