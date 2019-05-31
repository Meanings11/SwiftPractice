import UIKit

import UIKit


let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var largestKind = ""
for (type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = type
        }
    }
}
print("The largest number is \(largestKind) \(largest)")

var total = 0
for i in 0...4 {
    total += i
}
print(total)
// Prints "6"


func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(10)


func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


numbers.map({ (number: Int) -> Int in
    if number % 2 == 1{
        return 0
    }else{
        return 1
    }
})

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
// Prints "[60, 57, 21, 36]"

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
// Prints "[20, 19, 12, 7]"


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
//
//reversedNames = names.sorted(by: { (s1: String, s2: String) ->
//    Bool in
//        return s1 > s2
//})

let oppositeNames = names.sorted(by: { $1 > $0 } )
print(oppositeNames)
