//
//  Image.swift
//  FaceBookLike
//
//  Created by Leo on 6/5/16.
//  Copyright © 2016 Leo. All rights reserved.
//

import UIKit

class Image {
    static var images = [Image(name:"Antelope", description: "What a nice amazing and beautiful place with wonderful view and history, but just one thing that there are too much sand....."), Image(name:"WSU",description:"It's so comfortable walking here in WhastonUniversity, all around the cherry tree and nice people. Such a good place.")]
    
    var name: String
    var description: String?
    
    init(name: String, description: String?){
        self.name = name
        self.description = description
    }

}

class UserPhoto {
    static var userPhoto = [UserPhoto(name:"Greg"), UserPhoto(name:"Powell")]
    static var mySelfPhoto = [UserPhoto(name:"pier")]
    
    var name: String
    init(name:String){
        self.name = name
    }
    
}