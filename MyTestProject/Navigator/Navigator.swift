//
//  Navigator.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showStartScreenVC(view: UIViewController)
    func showListFoodVC(view: UIViewController, type: RecipeType)
    func showRecipeDetailVC(view: UIViewController, recipe: Recipe)
    func showStartVC() -> UIViewController
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    private let networking = Networking()
    
    func showStartScreenVC(view: UIViewController) {
        let vc = assembler.createMainVC(navigator: self)
        view.navigationController?.pushViewController(vc, animated: true)    }
    
    func showListFoodVC(view: UIViewController, type: RecipeType) {
        let vc = assembler.createListFoodVC(navigator: self, networking: networking, type: type)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showRecipeDetailVC(view: UIViewController, recipe: Recipe) {
        let vc = assembler.createRecipeDetailsVC(networking: networking, recipe: recipe)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showStartVC() -> UIViewController {
        let vc = assembler.createStartVC(navigator: self)
        return vc
    }
}
