//
//  getRandomNum.swift
//  BullsAndCows
//
//  Created by Leo on 5/30/16.
//  Copyright © 2016 Brian. All rights reserved.
//
// TODO: 2. generate your answear here
// You need to generate 4 random and non-repeating digits.
// Some hints: http://stackoverflow.com/q/24007129/938380

import UIKit

class GetRandomNum: NSObject {
    
    var randomNum = [String]()
    var indexArray = [String]()
    
    func generateAnswearFrom(from: Int, to: Int , digi: Int  ) -> [String]{
        
        for i in from...to{
            indexArray.append("\(i)")
        }
        randomNum.removeAll()
        for _ in 0...digi-1{
            let arrayIndex = Int(arc4random_uniform(UInt32(indexArray.count)))
            let arrayNum = indexArray[arrayIndex] // answearArray.append(numArray.removeAtIndex(xxx)) <- nice
            randomNum.append(arrayNum)
            indexArray.removeAtIndex(arrayIndex) //remove returns values
        }
        return randomNum
    }
    
}
