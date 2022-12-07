//
//  StartPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 12/3/22.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol StartPresenterProtocol {
    func showFoodCollectionViewVC(view: UIViewController)
}

// MARK: - StartVC

class StartPresenter: StartPresenterProtocol {
    
    // MARK: - Properties
    
    let navigator: NavigatorProtocol
    
    // MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}

// MARK: - Extension

extension StartPresenter {
    func showFoodCollectionViewVC(view: UIViewController) {
        navigator.showStartScreenVC(view: view)
    }
}
