//
//  UserActions.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/10/22.
//

import Foundation
import UIKit

enum UserActions: String, CaseIterable {
    case meat = "Meat"
    case fish = "Fish"
    case chicken = "Chicken"
    case milk = "Milk"
    
    var image: UIImage? {
        UIImage(named: self.rawValue)
    }
}

