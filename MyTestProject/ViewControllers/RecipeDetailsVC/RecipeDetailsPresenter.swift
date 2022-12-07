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
}

// MARK: - RecipeDetailsPresenter

class RecipeDetailsPresenter {
    
    // MARK: - Properties
    
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
    
}
