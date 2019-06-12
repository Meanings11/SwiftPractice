//
//  Icon.swift
//  Project6.CollectionView
//
//  Created by 李名夫 on 5/31/19.
//  Copyright © 2019 李名夫. All rights reserved.
//

import Foundation

struct Icon {
    var name:String =  ""
    var price:Double = 0.0
    var isFeatured: Bool = false
    var description = ""
    var imageName:String = ""
    
    init(name: String, imageName: String,description: String, price: Double, isFeatured: Bool) {
        self.name = name
        self.price = price
        self.imageName = imageName
        self.description = description
        self.isFeatured = isFeatured
    }
}
