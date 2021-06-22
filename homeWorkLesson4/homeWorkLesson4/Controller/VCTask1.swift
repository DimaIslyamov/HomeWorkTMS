//
//  ViewController.swift
//  homeWorkLesson4
//
//  Created by Moobat on 22.06.21.
//

import UIKit

class VCTask1: UIViewController {

    let mechanic: (name: String, age: Int, sallary: Float) = ("Oleg", 23, 5.577)
    let welder: (name: String, age: Int, sallary: Float) = ("Gena", 35, 8.785)
    let machineOperator: (name: String, age: Int, sallary: Float) = ("Valera", 42, 10.125)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        salaryCalculationByAge(name: mechanic.name, age: mechanic.age, sallary: mechanic.sallary)
        salaryCalculationByAge(name: welder.name, age: welder.age, sallary: welder.sallary)
        salaryCalculationByAge(name: machineOperator.name, age: machineOperator.age, sallary: machineOperator.sallary)
    }
    
    
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
}

