//
//  StartScreenPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol FoodCollectionViewPresenterProtocol {
    var userActions: [RecipeType] { get }
    func showListFoodVC(indexPath: Int, view: UIViewController)
}

// MARK: - StartScreenPresenter

class FoodCollectionViewPresenter {
    
    // MARK: - Properties
    
    let userActions = RecipeType.allCases
    private let navigator: NavigatorProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}

    // MARK: - Extension

extension FoodCollectionViewPresenter: FoodCollectionViewPresenterProtocol {
    func showListFoodVC(indexPath: Int, view: UIViewController) {
        let userAction = userActions[indexPath]
        navigator.showListFoodVC(view: view, type: userAction)
    }
}
