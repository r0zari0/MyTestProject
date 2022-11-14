//
//  AlomofireNetwork.swift
//  MyTestProject
//
//  Created by Max Stovolos on 11/9/22.
//

import Foundation

protocol NetworkingProtocol {
    
}

class Networking {
    func getModel(closure: @escaping ([Recipe]) -> ()) {
        let stringURL = ""
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let response = response {
                print(response)
                return
            }
            if let data = data {
                print(data)
                return
            }
            let decoder = JSONDecoder()
            do {
                let food = try decoder.decode(FoodType.self, from: data!).hits
                //                DispatchQueue.main.async {
                //                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
