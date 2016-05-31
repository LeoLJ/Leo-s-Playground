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

class GameLogic: NSObject {
    
    var randomNumArr = [String]()
    var indexArray = [String]()
    
    func generateAnswearFrom(from: Int, to: Int , digi: Int  ) -> [String]{
            
        indexArray.removeAll()
        for i in from...to{
            indexArray.append("\(i)")
        }
        randomNumArr.removeAll()
        for _ in 0...digi-1{
            let arrayIndex = Int(arc4random_uniform(UInt32(indexArray.count)))
//            print("index\(arrayIndex)")
            let arrayNum = indexArray[arrayIndex]// answearArray.append(numArray.removeAtIndex(xxx)) <- nice
//            print("number\(arrayNum)")
            randomNumArr.append(arrayNum)
            indexArray.removeAtIndex(arrayIndex) //remove returns values
        }
        return randomNumArr
    }
        
    func containsDuplicate(nums: [Int]) -> Bool {
        var counts = [Int: Int]()
        var result = false
        for num in nums {
            if counts[num] == nil {
                counts[num] = 1
            }
            else {
                counts[num] = counts[num]! + 1
            }
        }
        for count in counts.values {
            if count >= 2 {
                result = true
                return result
            }
        }
        return result
    }
}
