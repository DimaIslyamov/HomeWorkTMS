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
        task1()
        print("------- Task 2 -------")
        printDays()
        
        print("------- Task 3 -------")
        task3()
        print("------- Task 4 -------")
        task4()
        print("------- Task 5 -------")
        print("\(task5FuncTwo(cwqe: quoantity))")
//        print("------- Task 6 -------")
//
        print("------- Task 7 -------")
        print("Максимальное число в массиве - \(returnMaxValue(arrayValue: arrayMass))")
        print("------- Task 8 -------")
        print("\(returnBoolValue(arrayValue: arrayMass))")
    }

    // MARK: - TASK 1
    
    let englishAlphabet = "abcdefghijklmnopqrstuvwxyz"
    let oneCharacter = "m"
    
    func task1()  {
        for (index, value) in englishAlphabet.enumerated() {
            if String(value) == oneCharacter {
                print("Индекс в строке: \(index)")
            }
        }
    }
    
    
    // MARK: - TASK 2 ????????????

    let daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var monthName = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    typealias TupleOfArray = [(month: String, daysAtMonths: Int)]

    func printDays(){
        for days in daysInMonths {
            print("\(days)")
        }
        
        for index in 0..<monthName.count {
            print("\(monthName[index]) - \(daysInMonths[index])")
        }
        
        // ????????
        
    }
    
    
    
    
    // MARK: - TASK 3
    
    let albhabet = "abcdefghijklmnopqrstuvwxyz"
    var emptyArray: [String] = []

    func task3() {
        for (_, symbol) in albhabet.enumerated().reversed() {
            emptyArray.append(String(symbol))
        }
        print("\(emptyArray)")
    }
    
    
    
    // MARK: - TASK 4
    
    let randomText = """
        On the other hand, we denounce with righteous 15 indignation and dislike men who are so beguiled and demoralized by the charms of pleasure 1993 of the moment, so blinded by desire, that they !cannot? foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is 231 the same as saying through shrinking from toil and pain. These 63514 cases are perfectly simple and easy to distinguish. In a free 86 hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every 5122 pleasure is to be welcomed and every pain avoided. But in certain 421 circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures 123 to secure other greater pleasures, or else he endures pains to avoid worse pains.
        """
    
    var quantityRandomText: QuantityRandomText = (letters: 0, numbers: 0, symbols: 0)
        
    func task4() {
        for value in randomText {
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
    
    
    
    // MARK: - TASK 5 ??????????
    
    
    let array = [1, 2, 3, 4, 5, 6, 7]
    let quoantity = 0...15
    
    func task5FuncOne(array: [Any]) -> [Any] {
        let array = array
        return array.reversed()
    }
    
    func task5FuncTwo(cwqe: ClosedRange<Int> ) -> [Any] {
        let cwqe = quoantity
        print("\(task5FuncOne(array: array))")
        return cwqe.reversed()
    }
    
    
    
    // MARK: - TASK 6 ?????????
    
    
    
    
    
    // MARK: - TASK 7
    
    let arrayMass = [12, 25, 76, 23, 246, 732, 524, 212, 87, 351, 555]
    
    func returnMaxValue(arrayValue: [Int]) -> Int {
        var maxValue = 0
        for valueMax in 0..<arrayMass.count {
            if arrayMass[valueMax] > maxValue {
                maxValue = arrayMass[valueMax]
            }
        }
        return maxValue
    }
    
    
    // MARK: - TASK 8
    
    let arrayReturnBool = [1, 2, 5, 6, 8, 7, 9, 4]
    
    func returnBoolValue(arrayValue: [Int]) -> [Bool] {
        var boolArray = [Bool]()
        for index in arrayReturnBool {
            if index % 2 == 0 {
                boolArray.append(true)
            } else {
                boolArray.append(false)
            }
        }
        return boolArray
    }
    
}
