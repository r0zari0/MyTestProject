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
    var screenType: ScreenType { get }
    
    func getInternetRecipes()
    func getRecipesCD()
    func showRecipeDetailVC(with recipe: Recipe, view: UIViewController)
}

// MARK: - ListFoodPresenter

class ListFoodPresenter: ListFoodPresenterProtocol {
    
    // MARK: - Properties
    
    let screenType: ScreenType
    var foodRecipes: [Hit] = []
    weak var view: ListFoodVCProtocol?
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    private let coreData: CoreDataStoreProtocol
    private let type: RecipeType
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol,
         networking: NetworkingProtocol,
         coreData: CoreDataStoreProtocol,
         type: RecipeType,
         screenType: ScreenType
    ) {
        self.navigator = navigator
        self.networking = networking
        self.coreData = coreData
        self.type = type
        self.screenType = screenType
    }
}

// MARK: - Extension

extension ListFoodPresenter {
    func getInternetRecipes() {
        view?.setupTitle(title: type.rawValue + " recipies")
        
        networking.getModel(type: type) { hit in
            self.foodRecipes = hit
            self.view?.reload()
        }
    }
    
    func getRecipesCD() {
        coreData.fetchRecipes { [weak self] recipe in
            let likedRecipes = recipe.map(Recipe.init(recipe:))
            let hits = likedRecipes.map { Hit(recipe: $0) }
            self?.foodRecipes = hits
            self?.view?.reload()
        }
    }
    
    func showRecipeDetailVC(with recipe: Recipe, view: UIViewController) {
        navigator.showRecipeDetailVC(view: view, recipe: recipe)
    }
}
