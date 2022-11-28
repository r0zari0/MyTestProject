//
//  AlomofireNetwork.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation
import UIKit

protocol NetworkingProtocol {
    func getModel(type: UserActions, closure: @escaping ([Hit]) -> ())
    
}

class Networking: NetworkingProtocol {
    func getModel(type: UserActions, closure: @escaping ([Hit]) -> ()) {
        
        let foodType: String
        switch type {
        case .meat:
            foodType = "meat"
        case .fish:
            foodType = "fish"
        case .chicken:
            foodType = "chicken"
        case .milk:
            foodType = "milk"
        }
        
        let headers = [
            "X-RapidAPI-Key": "d48b37f797msh914f92f5efbf2b8p18795ejsn2d67a777e5d2",
            "X-RapidAPI-Host": "edamam-recipe-search.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://edamam-recipe-search.p.rapidapi.com/search?q=\(foodType)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
            }
            let decoder = JSONDecoder()
            do {
                if let data {
                    let food = try decoder.decode(FoodType.self, from: data)
                    print(food)
                    DispatchQueue.main.async {
                        closure(food.hits)
                    }
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
