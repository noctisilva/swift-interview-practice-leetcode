//: Point of this exercise is to practice the swift access control.

import Foundation

class Person {
    public private(set) var name: String
    public private(set) var dream: String
    
    init(name: String, dream: String) {
        self.name = name
        self.dream = dream
    }
}


//class Group {
//    let person = Person(name: "John", dream: "Be a good dev")
//    print(person.dream)
//}

/**************************************************/

class MyClass {
    public private(set) var publicReadOnly: Int = 10
    
    func increment() {
        publicReadOnly += 1
    }
    
    func decrement() {
        publicReadOnly -= 1
    }
}
//
class YourClass {
    let object = MyClass()
}

let object = YourClass()
print("Initial value: \(object.object.publicReadOnly)")

//object.object.publicReadOnly += 1

object.object.increment()
print("After increment method call: \(object.object.publicReadOnly)")

object.object.decrement()
print("After decrement method call: \(object.object.publicReadOnly)")
