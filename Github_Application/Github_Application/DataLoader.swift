//
//  DataLoader.swift
//  Github_Application
//
//  Created by Decagon on 21/11/2021.
//

import UIKit

class DataLoader {
    //MARK: - Method to get current weather data from API
   public func pullFollowersData(completionHandler: @escaping (FollowersData ) -> ()) {
        let url = "https://api.github.com/users/DANIEL197090/followers"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(FollowersData .self, from: data)
                        print("Here is the data")
                        print(json)
                        completionHandler(json)
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
//    public func pullListJSONData(completionHandler: @escaping (Welcome) -> ()) {
//         let url = "https://api-prod.autochek.africa/v1/inventory/car/search"
//
//         if let url = URL(string: url) {
//             URLSession.shared.dataTask(with: url) { data, response, error in
//                 if let data = data {
//                     do {
//                         let json = try JSONDecoder().decode(Welcome.self, from: data)
//                         print("Data is loaded")
//                         print(json)
//                         completionHandler(json)
//                     } catch {
//                         print("\(error)")
//                     }
//                 }
//             }.resume()
//         }
//     }
  
}
