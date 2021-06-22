//
//  Task7.swift
//  homeWorkLesson3
//
//  Created by Moobat on 19.06.21.
//

import UIKit

class Task7: UIViewController {
    
    typealias Students = (name: String, carNumber: Int?, testResult: Int?)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("-------------Task 7-------------")
        check(name: studentMax.name, carNumber: studentMax.carNumber, testResult: studentMax.testResult)
        check(name: studentDima.name, carNumber: studentDima.carNumber, testResult: studentDima.testResult)
        check(name: studentMisha.name, carNumber: studentMisha.carNumber, testResult: studentMisha.testResult)
        check(name: studentOleg.name, carNumber: studentOleg.carNumber, testResult: studentOleg.testResult)
        check(name: studentAnjey.name, carNumber: studentAnjey.carNumber, testResult: studentAnjey.testResult)
    }
    
    let studentMax: Students = ("Max", 3017, nil)
    let studentDima: Students = ("Dima", nil, 8)
    let studentMisha: Students = ("Misha", 2567, nil)
    let studentOleg: Students = ("Oleg", 1777, 5)
    let studentAnjey: Students = ("Anjey", nil, 2)
    
    func check(name: String, carNumber: Int?, testResult: Int?) {
        var maxResult = "Имя студента: \(name), "
        
        if carNumber != nil {
            maxResult += "машина: есть, номер машины: \(String(describing: carNumber!)), "
        } else {
            maxResult += "машины: нету, номерa машины: нету, "
        }
        
        if testResult != nil {
            maxResult += "на контрольной был, оценка: \(String(describing: testResult!)). "
        } else {
            maxResult += "не был на контрольной, оценка Колл 🤣."
        }
        
        print(maxResult)
    }
}
