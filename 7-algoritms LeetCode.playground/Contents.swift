import UIKit

// задача 7 - Входные данные -  массив целых чисел nums и target. Верните индексы двух чисел так, чтобы они складывались в target. Вы можете предположить, что каждый вход будет иметь ровно одно решение, и вы не можете использовать один и тот же элемент дважды. Вы можете вернуть ответ в любом порядке.


let nums = [2, 77, 11, 97, 16, 79]
let target = 23

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    var arrIndex:[Int] = []

    for index in 0..<nums.count {

        let newIndex = index + 1

        for i in newIndex..<nums.count {

            if nums[index] + nums[i] == target {
                arrIndex.append(index)
                arrIndex.append(i)
                return arrIndex
            }
        }

    }

    return arrIndex
}

print(twoSum(nums, target))

