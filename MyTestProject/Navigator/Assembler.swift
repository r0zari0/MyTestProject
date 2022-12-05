//
//  Assembler.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

class Assembler {
    func createMainVC(navigator: NavigatorProtocol) -> UIViewController {
        let vc = FlowController(navigator: navigator)
        return vc
    }
    
    func createListFoodVC(navigator: NavigatorProtocol, networking: NetworkingProtocol, type: RecipeType) -> UIViewController {
        let presenter = ListFoodPresenter(navigator: navigator, networking: networking, type: type)
        let vc = ListFoodVC(presenter: presenter)
        presenter.view = vc
        return vc
    }
    
    func createRecipeDetailsVC(networking: NetworkingProtocol, recipe: Recipe) -> UIViewController {
        let presenter = RecipeDetailsPresenter(networking: networking, recipe: recipe)
        let vc = RecipeDetailsVC(presenter: presenter)
        
        return vc
    }
    
    func createStartVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = StartPresenter(navigator: navigator)
        let vc = StartVC(presenter: presenter)
        
        return vc
    }
    
}
