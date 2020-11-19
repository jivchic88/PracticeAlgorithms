import UIKit

// задача 8.1 - Для 32-битного целого числа вернуть обратные цифры целого числа. Предположим, мы имеем дело со средой, которая может хранить только целые числа в диапазоне 32-битных целых чисел со знаком. Для решения этой проблемы предположим, что ваша функция возвращает 0, когда обратное целое число переполняется.

//Вариант, если дано x: Int -->

func reverse(_ x: Int) -> Int {
    let newX: String = String(x)
    var y = ""
    var answer: Int

    for element in newX {

        y = element.description + y
    }

    if y.contains("-") {
        y.removeLast()
        y = "-" + y
    }

    answer = Int(y) ?? 0

    if answer > Int32.max || answer < Int32.min {
        return 0
    } else {
        return answer
    }
   }

print(reverse(-12386987))


//Вариант, если дано x: Int32 -->

//func reverse(_ x: Int32) -> Int32 {
//    let newX: String = String(x)
//    var y = ""
//
//    for element in newX {
//
//        y = element.description + y
//    }
//
//    if y.contains("-") {
//        y.removeLast()
//        y = "-" + y
//    }
//
//    return Int32(y) ?? 0
//
//}
//
//print(reverse(-12386987))


