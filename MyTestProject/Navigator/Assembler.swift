//
//  Assembler.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

class Assembler {
    func createStartScreenVC(navigator: NavigatorProtocol) -> UIViewController {
        let presenter = StartScreenPresenter(navigator: navigator)
        let vc = StartScreenVC(presenter: presenter)
        return vc
    }
}
