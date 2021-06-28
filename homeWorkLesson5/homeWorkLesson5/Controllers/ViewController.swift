//
//  ViewController.swift
//  homeWorkLesson5
//
//  Created by Moobat on 24.06.21.
//

import UIKit

class ViewController: UIViewController {

    typealias QuantityRandomText = (letters: Int, numbers: Int, symbols: Int)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("------- Task 1 -------")
        print("Индекс в строке: \(indexInString(string: englishAlphabet, char: oneCharacter))")
        print("------- Task 2 -------")
        printDaysAneMonths()
        print("------- Task 3 -------")
        print("\(conversionToArray(albhabet: albhabet))")
        print("------- Task 4 -------")
        countingTheQuantity(string: randomText)
        print("------- Task 5 -------")
        print("\(retutnsArrayInReverse(array: arrays))")
        print("\(funcWithSequence(rang: 10, 9, 8, 7))")
        print("------- Task 6 -------")
        print("\(takesString(string: stringTask6))")
        print("------- Task 7 -------")
        print("Максимальное число в массиве - \(returnMaxValue(arrayValue: arrayMass))")
        print("------- Task 8 -------")
        print("\(returnBoolValue(arrayValue: arrayReturnBool))")
    }

    // MARK: - TASK 1
    
    let englishAlphabet = "abcdefghijklmnopqrstuvwxyz"
    let oneCharacter = "m"
    
    func indexInString(string: String, char: String) -> Int {
        var intindex = 0
        for (index, value) in string.enumerated() {
            if String(value) == char {
                intindex = index
            }
        }
        return intindex
    }
    
    
    // MARK: - TASK 2 ??????

    let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var monthName = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    typealias TupleOfArray = [(month: String, daysAtMonths: Int)]

    func printDaysAneMonths(){
        for days in daysInMonths {
            print("\(days)")
        }
        
        print("----------------")
        
        for index in 0..<monthName.count {
            print("\(monthName[index]) - \(daysInMonths[index])")
        }
        
        print("----------------")
        
        let tupleMonthsAndDays = [("January", 31), ("February", 28), ("March", 31), ("April", 30), ("May", 31), ("June", 30), ("July", 31), ("August", 31), ("September", 30), ("October", 31), ("November", 30), ("December", 31)]
        
        for index in tupleMonthsAndDays {
            print("\(index.0) - \(index.1)")
        }
        
      // сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется) !?
        
        
        
        print("----------------")
        
        var daysCount = 0
        let takeDay = (month: "October", day: 31)
        for value in tupleMonthsAndDays {
            if takeDay.month == value.0 {
                daysCount += takeDay.day - 1
                break
            }
            daysCount += value.1
        }
        print("Количество дней до даты: \(daysCount)")
        
    }
    
    
    
    
    // MARK: - TASK 3
    
    let albhabet = "abcdefghijklmnopqrstuvwxyz"

    func conversionToArray(albhabet string: String) -> [String] {
        var emptyArray: [String] = []
        for (_, symbol) in string.enumerated() {
            emptyArray.insert(String(symbol), at: 0)
        }
        return emptyArray
    }
    
    
    
    // MARK: - TASK 4
    
    let randomText = """
        On the other hand, we denounce with righteous 15 indignation and dislike men who are so beguiled and demoralized by the charms of pleasure 1993 of the moment, so blinded by desire, that they !cannot? foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is 231 the same as saying through shrinking from toil and pain. These 63514 cases are perfectly simple and easy to distinguish. In a free 86 hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every 5122 pleasure is to be welcomed and every pain avoided. But in certain 421 circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures 123 to secure other greater pleasures, or else he endures pains to avoid worse pains.
        """
    
    var quantityRandomText: QuantityRandomText = (letters: 0, numbers: 0, symbols: 0)
        
    func countingTheQuantity(string: String) {
        for value in string {
            switch value {
            case "a"..."z":
                quantityRandomText.letters += 1
            case "0"..."9":
                quantityRandomText.numbers += 1
            case ".", ",", "!", "?":
                quantityRandomText.symbols += 1
            default:
                break
            }
        }
        print("количество цифр: \(quantityRandomText.numbers), количество букв: \(quantityRandomText.letters), количество символов: \(quantityRandomText.symbols)")
    }
    
    
    
    // MARK: - TASK 5
    
    
    let arrays = [1, 2, 3, 4, 5, 6, 7]
    
    func retutnsArrayInReverse(array: [Any]) -> [Any] {
        var emptyArray: [Any] = []
        for value in array {
            emptyArray.insert(value, at: 0)
        }
        return emptyArray
    }
    
    func funcWithSequence(rang: Any...) -> [Any] {
        return retutnsArrayInReverse(array: rang)
    }
    
    
    
    
    // MARK: - TASK 6
    var stringTask6 = "But., in certain 4 2 1, circumstances, and 5 4 owing to the. claims of duty."
    
    func takesString(string: String) -> String {
        var newString = ""
        let numbers = ["zero", "one", "two", "three", "four", "five", "sex", "seven", "eight", "nine"]
        
        for value in string.lowercased() {
            switch String(value) {
            case "a", "e", "i", "o", "u", "y":
                newString += value.uppercased()
            case "b"..."z":
                newString += String(value)
            case "0"..."9":
                newString += numbers[Int(String(value)) ?? 0]
            case " ":
                newString += " "
            default:
                break
            }
        }
        return newString
    }
    
    
    
    // MARK: - TASK 7
    
    let arrayMass = [12, 25, 76, 23, 246, 732, 524, 212, 87, 351, 555]
    
    func returnMaxValue(arrayValue: [Int]) -> Int {
        var maxValue = 0
        for valueMax in 0..<arrayValue.count {
            if arrayValue[valueMax] > maxValue {
                maxValue = arrayValue[valueMax]
            }
        }
        return maxValue
    }
    
    
    // MARK: - TASK 8
    
    let arrayReturnBool = [1, 2, 5, 6, 8, 7, 9, 4]
    
    func returnBoolValue(arrayValue: [Int]) -> [Bool] {
        var boolArray = [Bool]()
        for index in arrayValue {
            if index % 2 == 0 {
                boolArray.append(true)
            } else {
                boolArray.append(false)
            }
        }
        return boolArray
    }
    
}
