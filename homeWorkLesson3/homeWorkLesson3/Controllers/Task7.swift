//
//  Task7.swift
//  homeWorkLesson3
//
//  Created by Moobat on 19.06.21.
//

import Foundation
import UIKit

class Task7: UIViewController {
    
    typealias Students = (name: String, carNumber: Int?, testResult: Int?)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTask()
    }
    
    func studentTask() {
        print("-------------Task 7-------------")
        // MARK: Student Max
        let studentMax: Students = ("Max", 3017, nil)
        
        var maxResult = "Имя студента: \(studentMax.name), "
        
        if studentMax.carNumber != nil {
            maxResult += "машина: есть, "
        } else {
            maxResult += "машины: нету, "
        }
        
        if studentMax.carNumber != nil {
            maxResult += "номер машины: \(String(describing: studentMax.carNumber!)), "
            } else {
                maxResult += "номер машины нету, "
            }
        
        if studentMax.testResult != nil {
            maxResult += "на контрольной был "
        } else {
            maxResult += "не был на контрольной "
        }
        
        if studentMax.testResult != nil {
            maxResult += "оценка: \(String(describing: studentMax.testResult!)). "
            } else {
                maxResult += "оценка Колл 🤣."
            }
        
        print(maxResult)
        
        // MARK: Student Dima
        let studentDima: Students = ("Dima", nil, 8)
        
        var dimaResult = "Имя студента: \(studentDima.name), "

        if studentDima.carNumber != nil {
            dimaResult += "машина: есть, "
        } else {
            dimaResult += "машины: нету, "
        }
        
        if studentDima.carNumber != nil {
            dimaResult += "номер машины: \(String(describing: studentDima.carNumber!)), "
            } else {
                dimaResult += "номерa машины нету, "
            }
        
        if studentDima.testResult != nil {
            dimaResult += "на контрольной был "
        } else {
            dimaResult += "не был на контрольной "
        }
        
        if studentDima.testResult != nil {
            dimaResult += "оценка: \(String(describing: studentDima.testResult!)). "
            } else {
                dimaResult += "оценка Колл 🤣."
            }
        
        print(dimaResult)
        
        // MARK: Student Misha
        let studentMisha: Students = ("Misha", 2567, nil)
        
        var mishaResult = "Имя студента: \(studentMisha.name), "
        
        if studentMisha.carNumber != nil {
            mishaResult += "машина: есть, "
        } else {
            mishaResult += "машины: нету, "
        }
        
        if studentMisha.carNumber != nil {
            mishaResult += "номер машины: \(String(describing: studentMisha.carNumber!)), "
            } else {
                mishaResult += "номерa машины нету, "
            }
        
        if studentMisha.testResult != nil {
            mishaResult += "на контрольной был "
        } else {
            mishaResult += "не был на контрольной "
        }
        
        if studentMisha.testResult != nil {
            mishaResult += "оценка: \(String(describing: studentMisha.testResult!)). "
            } else {
                mishaResult += "оценка Колл 🤣."
            }
        
        print(mishaResult)

        // MARK: Student Oleg
        let studentOleg: Students = ("Oleg", 1777, 5)
        
        var olerResult = "Имя студента: \(studentOleg.name), "

        if studentOleg.carNumber != nil {
            olerResult += "машина: есть, "
        } else {
            olerResult += "машины: нету, "
        }
        
        if studentOleg.carNumber != nil {
            olerResult += "номер машины: \(String(describing: studentOleg.carNumber!)), "
            } else {
                olerResult += "номерa машины нету, "
            }
        
        if studentOleg.testResult != nil {
            olerResult += "на контрольной был "
        } else {
            olerResult += "не был на контрольной "
        }
        
        if studentOleg.testResult != nil {
            olerResult += "оценка: \(String(describing: studentOleg.testResult!)). "
            } else {
                olerResult += "оценка Колл 🤣."
            }
        
        print(olerResult)
        
        // MARK: Student Anjey
        let studentAnjey: Students = ("Anjey", nil, 2)
        
        var anjeyResult = "Имя студента: \(studentAnjey.name), "
        
        if studentAnjey.carNumber != nil {
            anjeyResult += "машина: есть, "
        } else {
            anjeyResult += "машины: нету, "
        }
        
        if studentAnjey.carNumber != nil {
            anjeyResult += "номер машины: \(String(describing: studentAnjey.carNumber!)), "
            } else {
                anjeyResult += "номерa машины нету, "
            }
        
        if studentAnjey.testResult != nil {
            anjeyResult += "на контрольной был "
        } else {
            anjeyResult += "не был на контрольной "
        }
        
        if studentAnjey.testResult != nil {
            anjeyResult += "оценка: \(String(describing: studentAnjey.testResult!)). "
            } else {
                anjeyResult += "оценка Колл 🤣."
            }
        
        print(anjeyResult)
    }
}
