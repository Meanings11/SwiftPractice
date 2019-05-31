//
//  Restaurant.swift
//  Project4_foodPin
//
//  Created by 李名夫 on 5/28/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import Foundation

class Restaurant{
    var name = ""
    var location = ""
    var phone = ""
    var type = ""
    var image = ""
    var isVisited = false
    var rating = ""
    
    init(name: String, type: String, location: String,phone: String, image: String, isVisited: Bool) {
        self.name = name
        self.location = location
        self.phone = phone
        self.type = type
        self.image = image
        self.isVisited = isVisited
    }
}
