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
    var recipe: Recipe { get }
    
    func getImage(closure: @escaping (UIImage) -> ())
}
 
// MARK: - RecipeDetailsPresenter

class RecipeDetailsPresenter {
    let networking: NetworkingProtocol
    
    var recipe: Recipe
    
    // MARK: - Init
    init(networking: NetworkingProtocol, recipe: Recipe) {
        self.networking = networking
        self.recipe = recipe
    }
}

// MARK: - Extension
extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    func getImage(closure: @escaping (UIImage) -> ()) {
//        recipe.loadAsyncImage(image: recipe.image) { image in
//            closure(image)
//        }
//        Networking.loadAsyncImage(url: recipe.image) { <#Data#>, <#URLResponse#> in
//            <#code#>
//        }
    }
}
