import UIKit

var array = [0, 10, 0, 1, 2, 3, 0, 0, 4, 0]

func rearrangeZeros(array: inout [Int]) -> [Int] {

    var notZeroIndex = 0

    for i in 0..<array.count {
        if array[i] != 0 {
            array[notZeroIndex] = array[i]
            array[i] = 0
            notZeroIndex += 1
        }
    }
    return array
}

print(rearrangeZeros(array: &array))
