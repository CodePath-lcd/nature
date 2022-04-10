//
//  Hike.swift
//  Naturely
//
//  Created by Luis Mora on 4/9/22.
//

import Foundation
import UIKit

class Hike {
    
    var imageURL: URL?
    var name: String
    var coordinates: [String: Double]
    
    //initializer
    init(dict: [String: Any]) {
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        coordinates = dict["coordinates"] as! [String: Double];
    }
    
}
