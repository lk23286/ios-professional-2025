import UIKit

var greeting = "Hello, playground"

var pages = ["first","second","third","first","second","third"]


print(pages)
let index = pages.firstIndex(of: "third")!
print(index)

var currentVC: String {
didSet {
        guard let index = pages.firstIndex(of: currentVC) else {return}
    
    
    }
}
currentVC = "first"

