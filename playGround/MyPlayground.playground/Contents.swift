//import UIKit
//
//var indexA = ["0","1","2","3","4","5","6","7","8","9"]
//var answear = [String]()
//for i in 0...3{
//    let arrayIndex = Int(arc4random_uniform(10-UInt32(i)))
//    let arrayNum = indexA[arrayIndex]
//    answear.append(arrayNum)
//    indexA.removeAtIndex(arrayIndex)
//}

//print(answear)
//
//var a = 3.0
//var b = 3.3
//var c = 0.0
//
//if a > 0 {
//    c = (a * b) / a}
//else{
//    c = b }
//print(c)


func returnEven(n: Int) -> Bool {
    return n % 2 == 0
}
returnEven(3)

class Animal {
    let a:String
    let b:String
    let c:String
    let d:String
    let e:String
    let f:String
    let g:String
    
    init(界: String, 門: String, 綱: String, 目: String, 科: String, 屬: String, 種: String) {
        self.a = 界
        self.b = 門
        self.c = 綱
        self.d = 目
        self.e = 科
        self.f = 屬
        self.g = 種
    }
}

let monkey = Animal(界: "動物", 門: "door", 綱: "whatever", 目: "well", 科: "kerker", 屬: "hmm", 種: "mix")




class dog: Animal{
    private let age: Int
    let gender: String
    let hairColor: String
    private let name: String
    
    init(age: Int, gender: String, hairColor: String, name: String){
        self.age = age
        self.gender = gender
        self.hairColor = hairColor
        self.name = name
        
        super.init(界: "動物", 門: "door", 綱: "whatever", 目: "well", 科: "kerker", 屬: "hmm", 種: "mix")

    }
}

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
var a = GetRandomNum().generateAnswearFrom(0, to: 100, digi: 5)
