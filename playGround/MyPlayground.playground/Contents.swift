import UIKit

var indexA = ["0","1","2","3","4","5","6","7","8","9"]
var answear = [String]()
for i in 0...3{
    let arrayIndex = Int(arc4random_uniform(10-UInt32(i)))
    let arrayNum = indexA[arrayIndex]
    answear.append(arrayNum)
    indexA.removeAtIndex(arrayIndex)
}

print(answear)