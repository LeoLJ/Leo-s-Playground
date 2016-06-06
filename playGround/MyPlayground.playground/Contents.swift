import Foundation

class Person:NSObject {
    var firstName: String
    var lastName: String
    
    init(firstNamA: String, lastNamA: String) {
        self.firstName = firstNamA
        self.lastName = lastNamA
    }
    
    func getFullName() -> String {
        return "\(firstName) \(lastName)"
    }
}

class Doctor: Person {
    
    var firstN: String
    var lastN:  String
    
     init(firstNB: String, lastNamB: String ) {
        
            self.firstN = firstNB
            self.lastN = lastNamB
            super.init(firstNamA: firstN, lastNamA: lastN)
//            self.firstName = firstNa
//            self.lastName = lastNa
    }
    
    override func getFullName() -> String {
        return "Dr. \(lastN)"
    }
}
  let someDoctor = Doctor(firstNB:"Sam", lastNamB:"Smith")
someDoctor.getFullName()
