
import UIKit
//var a = arc4random_uniform(10)
//var b = arc4random_uniform(10)
//var c = arc4random_uniform(10)
//var d = arc4random_uniform(10)
//var answer = [UInt32]()
//if a == b || a == c || a == d{
//    a = arc4random_uniform(10)
//}; if b == c || b == d || a == b{
//    b = arc4random_uniform(10)
//}; if c == d || c == b || c == a{
//    c = arc4random_uniform(10)
//}; if d == a || d == b || d == c{
//    
//   var reAnswer = [a,b,c,d]
//    reAnswer = answer
//    answer = [a,b,c,d]
//}
//answer = [a, b, c, d]
//print(answer)


//
//var indexA = [0,1,2,3,4,5,6,7,8,9]
//var random = [Int]()
//for i in 0...3{
//    var arrayIndex = Int(arc4random_uniform(10-UInt32(i)))
//    var arrayNum = indexA[arrayIndex]
//    random.append(arrayNum)
//    indexA.removeAtIndex(arrayIndex)
//    print(arrayNum)
//}
//print(random)



//
//var answer = [4,3,5,6]
//var guess = [7,4,5,6]
//var charA = 0
//var charB = 0
//for i in 0...3 {
//    if guess[i] == answer[i]{
//    charA += 1
//    }
//    else {
//        for num in guess {
//            if num == answer[i]{
//                charB+=1
//            }
//        }
//    }
//}
//print(charA)
//print(charB)
//    for num in answer{
//    if num == answer[0]{
//        print(num, answer[i])
//            charB = 4 - charA
//        }
//        }

//var guessArray = [Int("guessString")]
//
//todo 2
var indexA = [0,1,2,3,4,5,6,7,8,9]
var answear = [Int]()
for i in 0...3{
    let arrayIndex = Int(arc4random_uniform(10-UInt32(i)))
    let arrayNum = indexA[arrayIndex]
    answear.append(arrayNum)
    indexA.removeAtIndex(arrayIndex)
}

//todo 3
//   var guessArray = [Int("guessString")]
//            var charA = 0
//            var charB = 0
//            for i in 0...3 {
//            if guessArray[i] == answear[i]{
//                charA += 1
//            }
//
//todo4
//let hint = "\(charA)A\(charB)B"



//let guessArray = guessString.characters.flatMap{Int(String($0))}
//var charA = 0
//var charB = 0
//for i in 0...3 {
//    if guessArray[i] == answear[i]{
//        charA += 1
//    }else {
//        for num in guessArray{
//            if num == answear[i]{
//                charB += 1
//            }
//        }
//    }
//}
//print(charA, charB)
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

let string = [1,2,2,5,6]
containsDuplicate(string)