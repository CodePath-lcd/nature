//
//  API.swift
//  Naturely
//
//  Created by Luis Mora on 4/9/22.
//

import Foundation


struct API {
    
    static func getHikes(completion: @escaping ([Hike]?) -> Void) {
        
        // ––––– TODO: Add your own API key!
        let apikey = "3txVQbuKT7Su94RUiNMAqIHHz77KSt1Jet6isl51iaX9oXjHQAxnnmH539pt_HAwmaJSqOiMm44ngjjp2qtUlrE_gdBbX9UkdrgwMcQfVWXMmb3_ehzkiPRsAQxSYnYx"
        
        // Coordinates for Merced
        let lat = 37.3022
        let long = -120.4830
        
        //using keyword "hiking" with merced coordinates
        let url = URL(string: "https://api.yelp.com/v3/businesses/search?term=hiking&latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let hikeDictionaries = dataDictionary["businesses"] as! [[String: Any]]
                //var hikes: [Hike] = []
                let hikes = hikeDictionaries.map({ Hike.init(dict: $0) })
                
                //initializing each hike from the passed in data dictionaries
//                for dictionary in hikeDictionaries {
//                    let hike = Hike.init(dict: dictionary)
//                    hikes.append(hike) //adding hike to array
//                }
                return completion(hikes)
                
                }
            }
            task.resume()
        }
}
