//
//  RecipeDetailsPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/18/22.
//

import Foundation
import UIKit

protocol RecipeDetailsPresenterProtocol {
    var recipe: Recipe { get }
    func getImage(closure: @escaping (UIImage) -> ())
}

class RecipeDetailsPresenter {
    let networking: NetworkingProtocol
    
    var recipe: Recipe
    
    init(networking: NetworkingProtocol, recipe: Recipe) {
        self.networking = networking
        self.recipe = recipe
    }
}

extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    func getImage(closure: @escaping (UIImage) -> ()) {
        recipe.loadAsyncImage(image: recipe.image) { image in
            closure(image)
        }
    }
}
