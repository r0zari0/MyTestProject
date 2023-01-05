//
//  TabBarAppearance.swift
//  MyTestProject
//
//  Created by Max Stovolos on 1/4/23.
//

import Foundation
import UIKit

struct TabBarAppearance {
    
    static var shared = TabBarAppearance()
    
    func setAppearance() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .white
        UITabBar.appearance().tintColor = .buttonColor
    }
}
