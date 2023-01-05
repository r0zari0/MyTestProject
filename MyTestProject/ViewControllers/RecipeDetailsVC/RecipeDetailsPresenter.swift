//
//  RecipeDetailsPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/18/22.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol RecipeDetailsPresenterProtocol {
    var detailedRecipe: Recipe { get }
    var isFavorite: Bool { get set }
    
    func saveRecipeInDataBase()
    func showWebView(view: UIViewController)
}

// MARK: - RecipeDetailsPresenter

class RecipeDetailsPresenter {
    
    // MARK: - Properties
    
    var isFavorite: Bool = false
    var detailedRecipe: Recipe
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingProtocol
    private let coreData: CoreDataStoreProtocol
    
    // MARK: - Init
    
    init(
        networking: NetworkingProtocol,
         detailedRecipe: Recipe,
         coreData: CoreDataStoreProtocol,
         navigator: NavigatorProtocol
    ) {
        self.networking = networking
        self.detailedRecipe = detailedRecipe
        self.coreData = coreData
        self.navigator = navigator
        
        checkIfElementInCD()
    }
}

// MARK: - Extension

extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    func checkIfElementInCD() {
        isFavorite = coreData.fetchRequestIfConsistElement(with: detailedRecipe.label)
    }
    
    func saveRecipeInDataBase() {
        guard !coreData.fetchRequestIfConsistElement(with: detailedRecipe.label) else {
            coreData.deleteRecipe(label: detailedRecipe.label)
            return
        }
                
        let recipeDataBase = LikedFoodCD(context: coreData.context)
        recipeDataBase.recipeName = detailedRecipe.label
        recipeDataBase.recipeImage = detailedRecipe.image
        recipeDataBase.recipeAuthor = detailedRecipe.source
        recipeDataBase.totalTime = detailedRecipe.totalTime
        recipeDataBase.totalWeight = detailedRecipe.totalWeight
        recipeDataBase.calories = detailedRecipe.calories
        recipeDataBase.url = detailedRecipe.url
        
        detailedRecipe.ingredients.forEach { ingredient in
            let dataBaseIngredient = LikedIngredientCD(context: self.coreData.context)
            dataBaseIngredient.text = ingredient.text
            dataBaseIngredient.image = ingredient.image
            
            recipeDataBase.addToLikedIngredients(dataBaseIngredient)
        }
        coreData.saveContext()
    }
    
    func showWebView(view: UIViewController) {
        navigator.showWebViewVC(view: view, url: detailedRecipe.url ?? "Error")
    }
}
