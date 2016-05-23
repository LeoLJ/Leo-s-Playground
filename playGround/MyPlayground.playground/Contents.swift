
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

//for a in range(0,4):
//for b in range (0,4):
//if guess_num[a]==ans[b]:
//cow+=1

var answer = [3,4,5,6]
var guess = [3,4,5,6]
var charA = 0
var charB = 0
for i in 0...3 {
    if guess[i] == answer[i]{
    charA += 1
    }
    for num in 0...3 {
        for nums in 0...3 {
        if guess[num] == answer[nums]{
            charB += 1
        }
        }
    }
}

print(charA)
print(charB)