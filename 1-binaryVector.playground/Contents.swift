import UIKit

let array = [1, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

var counter = 0
var maxCounter = 0

for element in array {
    if element == 1 {
        counter += 1
        if maxCounter < counter {
            maxCounter = counter
        }
    } else {
        counter = 0
    }
}

print(maxCounter)
