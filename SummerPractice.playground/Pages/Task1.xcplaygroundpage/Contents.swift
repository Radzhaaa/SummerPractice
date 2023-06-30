import UIKit

func fibonacci(n: Int) -> [Int] {
    var sequence = [0, 1]
    for i in 2..<n {
        let nextNumber = sequence[i-1] + sequence[i-2]
        sequence.append(nextNumber)
    }
    return sequence
}

func sort(rawArray: [Int]) -> [Int] {
    var sortedArray = rawArray
    for i in 0..<sortedArray.count - 1 {
        for j in 0..<sortedArray.count - i - 1 {
            if sortedArray[j] > sortedArray[j+1] {
                let temp = sortedArray[j]
                sortedArray[j] = sortedArray[j+1]
                sortedArray[j+1] = temp
            }
        }
    }
    return sortedArray
}

func firstLetter(strings: [String]) -> [Character] {
    var firstLetters: [Character] = []
    for string in strings {
        let firstLetter = string.first ?? Character("")
        firstLetters.append(firstLetter)
    }
    return firstLetters
}

func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
    var filteredArray: [Int] = []
    for element in array {
        if condition(element) {
            filteredArray.append(element)
        }
    }
    return filteredArray
}
