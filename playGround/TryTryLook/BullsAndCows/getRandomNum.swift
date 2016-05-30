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
    
    var random = [String]()
    var indexA = [String]()
    
    func generateAnswearFrom(from: Int, to: Int , digi: Int  ) -> [String]{
        
        for i in from...to{
            indexA.append("\(i)")
        }
        
        random.removeAll()
        for _ in 0...digi-1{
            let arrayIndex = Int(arc4random_uniform(UInt32(indexA.count)))
            //            let arrayNum = indexA[arrayIndex] // answearArray.append(numArray.removeAtIndex(xxx)) <- nice
            random.append(indexA.removeAtIndex(arrayIndex))
            //indexA.removeAtIndex(arrayIndex) //remove returns values
        }
        return random
    }
    
}
