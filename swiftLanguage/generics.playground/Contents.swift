import UIKit
//generics is very similiar to template in C++

//look at <Item> in grammar
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item]{
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

func anyCommonElements<T: Sequence, U:Sequence>(_ lhs: T, _ rhs: U)-> [T.Element]
    where T.Element: Equatable, T.Element == U.Element
{
    var commonElements:[T.Element] = []

    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem{
                commonElements.append(lhsItem)
            }
        }
    }
    return commonElements
}
anyCommonElements(["1","2","3"], ["3","1"])

