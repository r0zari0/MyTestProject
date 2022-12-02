//
//  UserActions.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/10/22.
//

import Foundation
import UIKit

enum RecipeType: String, CaseIterable {
    case meat = "Meat"
    case fish = "Fish"
    case chicken = "Chicken"
    case milk = "Milk"
    
    var partURL: String {
        switch self {
        case .meat:
            return "meat"
        case .fish:
            return "fish"
        case .chicken:
            return "chicken"
        case .milk:
            return "milk"
        }
    }
    
    var image: UIImage? {
        UIImage(named: self.rawValue)
    }
}
