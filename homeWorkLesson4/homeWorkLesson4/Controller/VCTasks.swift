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
        
        calculationAmountCredit(summOfCredit: 1200, period: 10, percent: 12)
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
        let unitFraction = percent / 100
        
        let monthlyPayment = (Float(summ) * unitFraction * pow((1 + unitFraction), Float(period))) / (12 * (pow((1 + unitFraction), Float(period)) - 1))
        
        let totalAmount = (monthlyPayment * 12) * Float(period)

        print("""
            Сумма кредита(руб.): \(summ)
            Период(количество лет): \(period)
            Процент: \(Int(percent))%
            Ежемесячно: \(Int(monthlyPayment))руб.
            Общая сумма: \(Int(totalAmount))руб.
            """)
    }
}
