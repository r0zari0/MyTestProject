//
//  Navigator.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showStartScreenVC() -> UIViewController
    func showListFoodVC(view: UIViewController, type: UserActions)
    func showRecipeDetailVC(view: UIViewController, recipe: Recipe)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    private let networking = Networking()
    
    func showStartScreenVC() -> UIViewController {
        let vc = assembler.createStartScreenVC(navigator: self)
        return vc
    }
    
    func showListFoodVC(view: UIViewController, type: UserActions) {
        let vc = assembler.createListFoodVC(navigator: self, networking: networking, type: type)
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showRecipeDetailVC(view: UIViewController, recipe: Recipe) {
        let vc = assembler.createRecipeDetailsVC(networking: networking, recipe: recipe)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
