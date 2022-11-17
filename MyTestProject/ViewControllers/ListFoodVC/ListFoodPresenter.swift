//
//  ListFoodPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/15/22.
//

import Foundation

  //MARK: - Protocol

protocol ListFoodPresenterProtocol {
    var foodRecipes: [Hit] { get }
    func getRecipes()
}

//MARK: - ListFoodPresenter
class ListFoodPresenter: ListFoodPresenterProtocol {
    
      //MARK: - Properties
    
    let navigator: NavigatorProtocol
    let networking: NetworkingProtocol
    let type: UserActions
    var foodRecipes: [Hit] = []
    weak var view: ListFoodVCProtocol?
    
    //MARK: - Init
    
    init(navigator: NavigatorProtocol, networking: NetworkingProtocol, type: UserActions) {
        self.navigator = navigator
        self.networking = networking
        self.type = type
    }
}

extension ListFoodPresenter {
    func getRecipes() {
        networking.getModel(type: type) { hit in
            self.foodRecipes = hit
            self.view?.reload()
        }
    }
}
