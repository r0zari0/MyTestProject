//
//  Assembler.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

class Assembler {
    func createStartScreenVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = StartScreenPresenter(navigator: navigator)
        let vc = StartScreenVC(presenter: presenter)
        return vc
    }
    
    func createListFoodVC(navigator: NavigatorProtocol, networking: NetworkingProtocol, type: UserActions) -> UIViewController {
        let presenter = ListFoodPresenter(navigator: navigator, networking: networking, type: type)
        let vc = ListFoodVC(presenter: presenter)
        presenter.view = vc
        return vc
    }
    
    func createRecipeDetailsVC(networking: NetworkingProtocol) -> UIViewController {
        let presenter = RecipeDetailsPresenter(networking: networking)
        let vc = RecipeDetailsVC(presenter: presenter)
        
        return vc
    }
}
