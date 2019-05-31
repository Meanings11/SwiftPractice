import UIKit

protocol Greetable {
    var name: String{get}   //var overhere
    func greet()
}

struct Person: Greetable {
    let name: String    //let name overhere
    func greet(){
        print("你好 \(name)")
    }
}

struct Cat: Greetable{
    let name: String
    func greet() {
        print("meow~ \(name)")
    }
}
//Person(name: "Mingfu").greet()

let array:[Greetable] = [
        Person(name: "Mingfu"),
        Cat(name: "Catty")]

for obj in array {
        obj.greet()
}

protocol ExampleProtocal {
    var simpleDescription: String {get}
    mutating func adjust()
    mutating func change()
}

class SimpleClass: ExampleProtocal {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
    
    func change() {
        simpleDescription += " has changed"
    }
}

var a = SimpleClass()
a.adjust()
let aDescription  = a.simpleDescription

struct SimpleStructure: ExampleProtocal {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
    mutating func change() {
        simpleDescription += " has changed"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

extension Int: ExampleProtocal {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
            self += 42
    }
    
    mutating func change() {
         self += 32
    }
}

print(7.simpleDescription)

extension Double: ExampleProtocal {
    var absoluteValue: Double {
        if self > 0.0 {
            return self
        }
        else{
            return -1 * self
        }
    }

    var simpleDescription: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 42
    }

    mutating func change() {
        self += 32
    }
}

print(4.0.absoluteValue)
print((-3.0).absoluteValue)

let protocolValue: ExampleProtocal = a
print(protocolValue.simpleDescription)

extension Double{
    var km: Double { return self * 1_000.0}
    var m: Double {return self}
    var cm: Double {return self/100.0}
    var mm: Double {return self/1_000.0}
    var ft: Double {return self/3.28084}
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) metters")


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))


extension Int {
    func repetitions(task: () -> Void){
        for _ in 0..<self{
            task()
        }
    }
}

3.repetitions {
    print("Hello!")
}

//add new enum cases
extension Int {
    enum Kind{
        case negative, zero, positive
    }
    var kind:Kind {
        switch self{
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

print(0.kind)

