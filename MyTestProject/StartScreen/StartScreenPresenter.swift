//
//  StartScreenPresenter.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation

protocol StartScreenPresenterProtocol {
    
}

class StartScreenPresenter: StartScreenPresenterProtocol {
    private let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
}
