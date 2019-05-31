import UIKit

enum Rank:Int{
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self{
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

func compareRank (first:Rank, second:Rank)->Bool{
    if first.rawValue > second.rawValue{
        return true
    }else{
        return false
    }
    
}


let ace = Rank.ace
let king = Rank.king
let aceRawValue = ace.rawValue
let kingRawValue = king.rawValue

compareRank(first: king, second: ace)

//converteedRank here is an optional ??
if let convertedRank = Rank(rawValue: 1){
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit:CaseIterable {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String{
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String{
        if self == .spades || self == .clubs {
            return "black"
        }else{
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

enum ServerReponse {
    case result(String, String)
    case failure(String)
    case neutral(String)
}

let success = ServerReponse.result("6:00 am", "8:09 pm")
let failure = ServerReponse.failure("Out of cheese.")
let neutral = ServerReponse.neutral("Waiting for replying")

switch neutral{
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure... \(message)")
    case let .neutral(state):
        print("He is... \(state)")
}

struct Card{
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//  a func output an array of Card with all combination of rank and suit
func showCard() -> [Card]{
    var deck:[Card] = []
    for suit in Suit.allCases{
        var rankCount = 1
        while let rank = Rank(rawValue: rankCount){
            deck.append(Card(rank: rank, suit: suit))
            rankCount += 1
        }
    }
    return deck
}

showCard()

enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}
