import UIKit
import Foundation

let comicTitle = "Black Cat (2019) #1"
var name = comicTitle.components(separatedBy: "(")[0]
var year = comicTitle.components(separatedBy: "(")[1]
var episode = year.components(separatedBy: "#")[1]
