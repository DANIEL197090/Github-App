//
//  DataLoader.swift
//  Github_Application
//
//  Created by Decagon on 21/11/2021.
//

import UIKit

class DataLoader {
    //MARK: - Method to get current weather data from API
  public func pullFollowersData(username:String, completionHandler: @escaping (FollowersData ) -> ()) {
        let url = "https://api.github.com/users/\(username)/followers"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(FollowersData .self, from: data)
                      print(json)
                        completionHandler(json)
                    } catch {
                        print("\(error.localizedDescription)")
                    }
                }
            }.resume()
        }
    }
}
