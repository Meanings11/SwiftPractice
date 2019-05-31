import UIKit

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

enum TerminalError: Error {
    case wrongFormat
}
func send(job: Int, toPrinter printerNamer:String) throws -> String {
    if printerNamer == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "")
//    throw PrinterError.onFire
    throw TerminalError.wrongFormat
    print(printerResponse)

}catch PrinterError.onFire{
    print("I'll just put this over here, with the rest of the fire.")
}catch let printerError as PrinterError{
    print("Printer error: \(printerError).")
}catch{
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool{
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false    //executed after all other code just before returns
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("eggs")
print(fridgeIsOpen)
