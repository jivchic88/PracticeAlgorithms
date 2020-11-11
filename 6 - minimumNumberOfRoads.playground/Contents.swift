import UIKit

var countCity: Int = 0 {
    didSet {
        if countCity < 2 || countCity > 1000 {
            print("Введено неверное значение - минимальное число городов 2, максимальное - 1000")
        }
    }
}


var k: Int = 0 {
    didSet {
        if k < 0 || k > 2000000000 {
            print("Введено неверное значение - Максимальное расстояние между городами, которое можно проехать без дозаправки должно быть положительным и не превышать 2 млрд")
        }
    }
}


var x: Int = 0 {
    didSet {
        if abs(x) > 1000000000 {
            print("Введено неверное значение - координата Х города не должна превышать 1 млрд")
        }
    }
}

var y: Int = 0 {
    didSet {
        if abs(x) > 1000000000 {
            print("Введено неверное значение - координата Y города не должна превышать 1 млрд")
        }
    }
}

var arrCity: [(x: Int, y: Int)]
arrCity = [(0,0),(1,0), (0,1), (1,1), (2,0), (2,2), (2,4)]

var numberStartCity: Int = 0 {
    didSet {
        if numberStartCity > numberFinishCity || numberStartCity < 0 {
            print("Введено неверное значение numberStartCity")
        }
    }
}


var numberFinishCity: Int = 0 {
    didSet {
        if numberFinishCity > arrCity.count || numberFinishCity < 0 {
            print("Введено неверное значение numberFinishCity")
        }
    }
}

numberFinishCity = 4
numberStartCity = 2
k = 1

let test = routeSearchBetweenCities(arrCity: arrCity, k: k, numberStartCity: numberStartCity, numberFinishCity: numberFinishCity)
print(test)


func routeSearchBetweenCities(arrCity: [(x: Int, y: Int)], k: Int, numberStartCity: Int, numberFinishCity: Int) -> Int {

    var checkStep: Int = 0
    let cityFinishCoordinates = arrCity[numberFinishCity - 1]

    var newArrSmall = cutArrayBeforeFinishCity(arrCity: arrCity, numberFinishCity: numberFinishCity)

    var indexNewStartCity = numberStartCity - 1
    var cityCoordinates = arrCity[indexNewStartCity]


    repeat {

        let newArr = cutArrBeforeNewStartCityWihtFoundIndex(arrCity: newArrSmall, foundIndex: indexNewStartCity)
        newArrSmall = newArr
        let arrDistanceFromCityToOthers = calculationDistanceFromCityToOthers(cityCoordinates: cityCoordinates, arrCity: newArrSmall)
        let arrCheckDistanceFromGasStation = checkDistanceFromGasStation(arrDistanceFromCityToOthers: arrDistanceFromCityToOthers, k: k)
        guard let index = foundIndex(arrCheckDistanceFromGasStation: arrCheckDistanceFromGasStation) else { return -1 }
        indexNewStartCity = index
        cityCoordinates = newArr[indexNewStartCity]
        checkStep += 1
    } while !((cityCoordinates.x == cityFinishCoordinates.x) && (cityCoordinates.y == cityFinishCoordinates.y))



    return checkStep
}



func cutArrayBeforeFinishCity(arrCity: [(x: Int, y: Int)], numberFinishCity: Int) -> [(x: Int, y: Int)] {

    var arrayBeforeFinishCity: [(x: Int, y: Int)] = []

    for index in 0..<numberFinishCity {
        arrayBeforeFinishCity.append(arrCity[index])
    }

    return arrayBeforeFinishCity
}



func calculationDistanceFromCityToOthers(cityCoordinates:(x: Int, y: Int), arrCity: [(x: Int, y: Int)]) -> [Int] {

    var arrDistanceFromCityToOthers: [Int] = []

    for element in arrCity {

        let distanceFromCityToOthers = abs(element.x - cityCoordinates.x) + abs(element.y - cityCoordinates.y)

        arrDistanceFromCityToOthers.append(distanceFromCityToOthers)

    }

    return arrDistanceFromCityToOthers
}


func checkDistanceFromGasStation(arrDistanceFromCityToOthers: [Int], k: Int) -> [Int] {

    var arrCheckDistanceFromGasStation: [Int] = []

    for element in arrDistanceFromCityToOthers {
        arrCheckDistanceFromGasStation.append(element-k)
    }
    return arrCheckDistanceFromGasStation
}



func foundIndex(arrCheckDistanceFromGasStation: [Int]) -> Int? {
  for index in 0..<arrCheckDistanceFromGasStation.count {
      if arrCheckDistanceFromGasStation[index] == 0 {
          return index
      }
  }
    return nil
}


func cutArrBeforeNewStartCityWihtFoundIndex(arrCity: [(x: Int, y: Int)], foundIndex: Int) -> [(x: Int, y: Int)] {

    var arrayNewStartCityWihtFoundIndex: [(x: Int, y: Int)] = []

    for index in foundIndex..<arrCity.count {
        arrayNewStartCityWihtFoundIndex.append(arrCity[index])
    }

    return arrayNewStartCityWihtFoundIndex
}

