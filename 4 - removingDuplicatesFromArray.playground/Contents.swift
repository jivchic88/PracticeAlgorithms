import UIKit

var array = [2, 2, 4, 4, 6, 8, 8, 10, 11, 12, 12, 12, 13, 15, 15]

// без сохранения порядка удалила дубликаты -
//let unique = Array(Set(array))
//print(unique)

func removeDuplicates(array: [Int]) -> [Int] {

    var newArr = [Int]()

    for element in array {
        if newArr.contains(element) == false {
            newArr.append(element)
        }
    }
   return newArr
}

print(removeDuplicates(array: array))
