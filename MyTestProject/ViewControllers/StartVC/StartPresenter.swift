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
    
}

// MARK: - StartVC

class StartPresenter: StartPresenterProtocol {
    
    let navigator: NavigatorProtocol
     
// MARK: - Init
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
    func showFoodCollectionViewVC(view: UIViewController) {
    
    }
}
