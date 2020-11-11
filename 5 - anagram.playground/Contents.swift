import UIKit

let lineOne: String = "vyuh"
let lineTwo: String = "yuvh"

func checkingAnagrams(lineOne: String, lineTwo: String) -> Bool {

    if lineOne.count == lineTwo.count {
        for element in lineOne {
            if !lineTwo.contains(element) { return false }
        }
        return true

    } else { return false }
}

print(checkingAnagrams(lineOne: lineOne, lineTwo: lineTwo))
