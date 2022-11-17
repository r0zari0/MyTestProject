//
//  StartScreenPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

protocol StartScreenPresenterProtocol {
    var userActions: [UserActions] { get }
    func showListFoodVC(indexPath: Int, view: UIViewController)
}

class StartScreenPresenter {
    let userActions = UserActions.allCases
    
    private let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
}

extension StartScreenPresenter: StartScreenPresenterProtocol {
    func showListFoodVC(indexPath: Int, view: UIViewController) {
        let userAction = userActions[indexPath]
        navigator.showListFoodVC(view: view, type: userAction)
    }
}
