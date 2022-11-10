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
}

class Navigator: NavigatorProtocol {
    
    private let assembler = Assembler()
    
    func showStartScreenVC() -> UIViewController {
        let vc = assembler.createStartScreenVC(navigator: self)
        return vc
    }
}
