//
//  image.swift
//  ViewControlerDemo
//
//  Created by Leo on 6/2/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class Image {
    static var images = [Image(name:"jump", description: "What a nice jump"), Image(name:"stand",description:"Stand up and ready to jump")]
    
    var name: String
    var description: String?
    
    init(name: String, description: String?){
        self.name = name
        self.description = description
    }
}
