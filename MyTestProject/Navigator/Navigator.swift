//
//  Navigator.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

protocol NavigatorProtocol {
    func showFoodCollectionViewVC(view: UIViewController)
    func showListFoodVC(view: UIViewController, type: RecipeType, screenType: ScreenType)
    func showRecipeDetailVC(view: UIViewController, recipe: Recipe)
    func showStartVC() -> UIViewController
    func showWebViewVC(view: UIViewController, url: String)
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func showFoodCollectionViewVC(view: UIViewController) {
        let vc = assembler.createMainVC(navigator: self)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        view.navigationController?.present(vc, animated: true)
    }
    
    func showListFoodVC(view: UIViewController, type: RecipeType, screenType: ScreenType) {
        let vc = assembler.createListFoodVC(navigator: self, type: type, screenType: screenType)
        vc.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showRecipeDetailVC(view: UIViewController, recipe: Recipe) {
        let vc = assembler.createRecipeDetailsVC(navigator: self, recipe: recipe)
//        vc.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showStartVC() -> UIViewController {
        let vc = assembler.createStartVC(navigator: self)
        return vc
    }
    
    func showWebViewVC(view: UIViewController, url: String) {
        let vc = assembler.createWebViewVC(url: url)
        view.hidesBottomBarWhenPushed = true
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

