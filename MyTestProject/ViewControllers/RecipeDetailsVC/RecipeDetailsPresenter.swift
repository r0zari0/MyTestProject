//
//  RecipeDetailsPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/18/22.
//

import Foundation

protocol RecipeDetailsPresenterProtocol {
    
}

class RecipeDetailsPresenter {
    let networking: NetworkingProtocol
    
    init(networking: NetworkingProtocol) {
        self.networking = networking
    }
}

extension RecipeDetailsPresenter: RecipeDetailsPresenterProtocol {
    
}
