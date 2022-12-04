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
}

struct Ingredient: Decodable {
    let text: String
    let image: String?
}
