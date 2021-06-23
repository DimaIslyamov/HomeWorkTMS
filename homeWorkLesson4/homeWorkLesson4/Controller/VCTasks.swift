//
//  ViewController.swift
//  homeWorkLesson4
//
//  Created by Moobat on 22.06.21.
//

import UIKit

class VCTasks: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        salaryCalculationByAge(name: mechanic.name, age: mechanic.age, sallary: mechanic.sallary)
        salaryCalculationByAge(name: welder.name, age: welder.age, sallary: welder.sallary)
        salaryCalculationByAge(name: machineOperator.name, age: machineOperator.age, sallary: machineOperator.sallary)
        
        arithmeticMeanOfNumbers(valueOne: 2.51, valueTwo: 2.2, valueTree: 3.67)
        
        calculationAmountCredit(summOfCredit: 4000, period: 8, percent: 13)
    }
    
    // MARK: - TASK 1
    
    let mechanic: (name: String, age: Int, sallary: Float) = ("Oleg", 23, 5.577)
    let welder: (name: String, age: Int, sallary: Float) = ("Gena", 35, 8.785)
    let machineOperator: (name: String, age: Int, sallary: Float) = ("Valera", 42, 10.125)
    
    func salaryCalculationByAge(name: String, age: Int, sallary: Float) {
        var sallarySumm = sallary
        
        switch age {
        case 18..<30:
            sallarySumm *= 1.5
        case 31..<40:
            sallarySumm *= 2
        case 41..<100:
            sallarySumm *= 3
        default:
            break
        }
        print("Имя работника: \(name), возраст: \(age), увеличение согласно возрасту: \(sallarySumm)")
    }
    
    
    // MARK: - Task 2
    
    func arithmeticMeanOfNumbers(valueOne a: Float, valueTwo b: Float, valueTree c: Float) {
        let summ = a + b + c / 3
        
        print("Среднее арифметическое: \(summ)")
    }
    
    
    // MARK: - TASK 3
    
    func calculationAmountCredit(summOfCredit summ: Int, period: Int, percent: Float) {
        let monthlyPayment = (summ * Int(percent) * (1 + Int(percent) * period)) / (12 * ((1 + Int(percent)) * period - 1))
        let totalAmount = (monthlyPayment * 12) * period
        
        print("""
            Сумма кредита(руб.): \(summ)
            Период(количество лет): \(period)
            Процент: \(percent / 100)%
            Ежемесячно: \(monthlyPayment)руб.
            Общая сумма: \(totalAmount)руб.
            """)
    }
}
