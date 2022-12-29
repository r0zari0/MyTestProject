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
    
    func saveRecipeInDataBase()
    
}

// MARK: - RecipeDetailsPresenter

class RecipeDetailsPresenter {
    
    // MARK: - Properties
    
    private let networking: NetworkingProtocol
    private let coreData: CoreDataStoreProtocol
    
    var detailedRecipe: Recipe
    
    // MARK: - Init
    
    init(networking: NetworkingProtocol, detailedRecipe: Recipe, coreData: CoreDataStoreProtocol) {
        self.networking = networking
        self.detailedRecipe = detailedRecipe
        self.coreData = coreData
    }
}

// MARK: - Extension

extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    func saveRecipeInDataBase() {
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
}
