//
//  ListFoodPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/15/22.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol ListFoodPresenterProtocol {
    var foodRecipes: [Hit] { get }
    
    func getRecipes()
    func showRecipeDetailVC(with recipe: Recipe, view: UIViewController)
}

// MARK: - ListFoodPresenter

class ListFoodPresenter: ListFoodPresenterProtocol {
    
    // MARK: - Properties
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    private let type: RecipeType
    
    var foodRecipes: [Hit] = []
    weak var view: ListFoodVCProtocol?
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol, type: RecipeType) {
        self.navigator = navigator
        self.networking = networking
        self.type = type
    }
}

// MARK: - Extension

extension ListFoodPresenter {
    func getRecipes() {
        networking.getModel(type: type) { hit in
            self.foodRecipes = hit
            self.view?.reload()
        }
    }
    
    func showRecipeDetailVC(with recipe: Recipe, view: UIViewController) {
        navigator.showRecipeDetailVC(view: view, recipe: recipe)
    }
}
