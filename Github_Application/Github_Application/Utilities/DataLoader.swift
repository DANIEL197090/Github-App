//
//  DataLoader.swift
//  Autochek_Assessment
//
//  Created by Decagon on 11/11/2021.
//

import UIKit

class DataLoader {
    //MARK: - Method to get current weather data from API
   public func pullJSONData(completionHandler: @escaping (Json4Swift_Base) -> ()) {
        let url = "https://api-prod.autochek.africa/v1/inventory/make?popular=true"
        
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode(Json4Swift_Base.self, from: data)
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
    public func pullListJSONData(completionHandler: @escaping (Welcome) -> ()) {
         let url = "https://api-prod.autochek.africa/v1/inventory/car/search"
         
         if let url = URL(string: url) {
             URLSession.shared.dataTask(with: url) { data, response, error in
                 if let data = data {
                     do {
                         let json = try JSONDecoder().decode(Welcome.self, from: data)
                         print("Data is loaded")
                         print(json)
                         completionHandler(json)
                     } catch {
                         print("\(error)")
                     }
                 }
             }.resume()
         }
     }
    public func pullDetailJSONData(completionHandler: @escaping (CarDetails) -> ()) {
         let url = "https://api-prod.autochek.africa/v1/inventory/car/pgHpI6GIH"
         
         if let url = URL(string: url) {
             URLSession.shared.dataTask(with: url) { data, response, error in
                 if let data = data {
                     do {
                         let json = try JSONDecoder().decode(CarDetails.self, from: data)
                         print("found data")
                         print(json)
                         completionHandler(json)
                     } catch {
                         print("\(error)")
                     }
                 }
             }.resume()
         }
     }
    
}
