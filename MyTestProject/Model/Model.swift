//
//  Model.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

struct FoodType: Decodable {
    let hits: [Hit]
}

struct Hit: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let label: String
    let image: String
    let source: String
    let calories: Double
    let totalWeight: Double
    let ingredients: [Ingredient]
    let url: String?
    let totalTime: Double
    
    init(label: String, image: String, source: String, calories: Double,
         totalWeight: Double, totalTime: Double, ingredients: [Ingredient]) {
        self.label = label
        self.image = image
        self.source = source
        self.calories = calories
        self.totalWeight = totalWeight
        self.totalTime = totalTime
        self.ingredients = ingredients
    }

    init(recipe: LikedFoodCD) {
        self.label = recipe.recipeName ?? ""
        self.image = recipe.recipeImage ?? ""
        self.source = recipe.recipeAuthor ?? ""
        self.calories = recipe.calories
        self.totalWeight = recipe.totalWeight
        self.totalTime = recipe.totalTime
        
        let ingredientCD = recipe.likedIngredients.array(of: LikedIngredientCD.self)
        let appIngredients = ingredientCD.map { Ingredient(ingredientCD: $0) }
        
        self.ingredients = appIngredients
    }
}

struct Ingredient: Decodable {
    let text: String
    let image: String?
    
    init(text: String, image: String) {
        self.image = image
        self.text = text
    }
    
    init(ingredientCD: LikedIngredientCD) {
        self.text = ingredientCD.text ?? ""
        self.image = ingredientCD.image
    }
}

extension Optional where Wrapped == NSSet {
    func array<T: Hashable>(of: T.Type) -> [T] {
        if let set = self as? Set<T> {
            return Array(set)
        }
        return [T]()
    }
}
