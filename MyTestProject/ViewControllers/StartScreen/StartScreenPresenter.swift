//
//  StartScreenPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

//MARK: - Protocol

protocol StartScreenPresenterProtocol {
    var userActions: [UserActions] { get }
    func showListFoodVC(indexPath: Int, view: UIViewController)
}

//MARK: - StartScreenPresenter

class StartScreenPresenter {
    let userActions = UserActions.allCases
    
    //MARK: - Properties
    
    private let navigator: NavigatorProtocol
    
    //MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
}

//MARK: - Extension

extension StartScreenPresenter: StartScreenPresenterProtocol {
    func showListFoodVC(indexPath: Int, view: UIViewController) {
        let userAction = userActions[indexPath]
        navigator.showListFoodVC(view: view, type: userAction)
    }
}
