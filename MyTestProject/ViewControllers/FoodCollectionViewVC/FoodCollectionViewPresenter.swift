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
    var recipeTypes: [RecipeType] { get }
    func showListFoodVC(indexPath: Int, view: UIViewController, screenType: ScreenType)
}

// MARK: - StartScreenPresenter

class FoodCollectionViewPresenter {
    
    // MARK: - Properties
    
    let recipeTypes = RecipeType.allCases
    private let navigator: NavigatorProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}

    // MARK: - Extension

extension FoodCollectionViewPresenter: FoodCollectionViewPresenterProtocol {
    func showListFoodVC(indexPath: Int, view: UIViewController, screenType: ScreenType) {
        let userAction = recipeTypes[indexPath]
        navigator.showListFoodVC(view: view, type: userAction, screenType: screenType)
    }
}
