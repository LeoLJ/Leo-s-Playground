//
//  Duplicate.swift
//  BullsAndCows
//
//  Created by Leo on 5/30/16.
//  Copyright © 2016 Brian. All rights reserved.
//

import UIKit

class Duplicate: NSObject {

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
