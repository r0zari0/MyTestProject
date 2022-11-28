//
//  Double.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/27/22.
//

import Foundation

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}
