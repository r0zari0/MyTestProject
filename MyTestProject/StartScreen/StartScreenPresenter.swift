//
//  StartScreenPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation

protocol StartScreenPresenterProtocol {
    var userActions: [UserActions] { get }
}

class StartScreenPresenter {
    let userActions = UserActions.allCases
    
    private let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
}

extension StartScreenPresenter: StartScreenPresenterProtocol {
    
}
