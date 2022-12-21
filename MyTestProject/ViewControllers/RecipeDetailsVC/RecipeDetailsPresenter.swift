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
    private let coreData: CoreDataStorePresenter
    
    var detailedRecipe: Recipe
    
    // MARK: - Init
    
    init(networking: NetworkingProtocol, detailedRecipe: Recipe, coreData: CoreDataStorePresenter) {
        self.networking = networking
        self.detailedRecipe = detailedRecipe
        self.coreData = coreData
    }
}

// MARK: - Extension

extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
    func getModelDataBase(closure: ([Recipe]) -> Void) {
        let recipeFetchRequest = LikedFoodCD.fetchRequest()
        
        do {
            let object = try coreData.context.fetch(recipeFetchRequest)
            
            let recipes = object.map(Recipe.init(recipe:))
            
            closure(recipes)
        } catch {
            print("error")
        }
    }
    
    func saveRecipeInDataBase() {
        let recipeDataBase = LikedFoodCD(context: coreData.context)
        recipeDataBase.recipeName = detailedRecipe.label
        recipeDataBase.recipeImage = detailedRecipe.image
        recipeDataBase.recipeAuthor = detailedRecipe.source
        recipeDataBase.totalTime = detailedRecipe.totalTime
        recipeDataBase.totalWeight = detailedRecipe.totalWeight
        recipeDataBase.calories = detailedRecipe.calories
        
        detailedRecipe.ingredients.forEach { ingredient in
            let dataBaseIngredient = LikedIngredientCD(context: self.coreData.context)
            dataBaseIngredient.text = ingredient.text
            dataBaseIngredient.image = ingredient.image
            
            recipeDataBase.addToLikedIngredients(dataBaseIngredient)
        }
        coreData.saveContext()
    }
    
    
}
