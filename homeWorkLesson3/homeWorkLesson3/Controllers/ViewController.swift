//
//  ViewController.swift
//  homeWorkLesson3
//
//  Created by Moobat on 18.06.21.
//

import UIKit

class ViewController: UIViewController {

    typealias MyAchievements = (pushUps: Int, pullUps: Int, squats: Int)
    typealias MessageOrError = (code: Int, message: String?, errorMessage: String?)
    typealias NonCode = (message: String?, errorMessage: String?)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        butt()
        achievements()
        task5()
        errorTask6()
        task8()
    }
    

    // MARK: - Tasks 1 2 3 4
    
    func achievements() {
        print("-------------Task 1 2 3 4-------------")
        // создание кортежа 1
        var myAchievements: MyAchievements = (90, 50, 65)
        print(myAchievements)
        // принт индекса и значения
        print("Значения по параметру pushUps: \(myAchievements.pushUps), pullUps: \(myAchievements.pullUps), squats: \(myAchievements.squats)")
        print("Значения по индексу pushUps: \(myAchievements.0), pullUps: \(myAchievements.1), squats: \(myAchievements.2)")
        
        // кортеж 2
        var igorAchievements: MyAchievements = (80, 20, 50)
        // использование промежуточной переменной
        let intermediateVar = myAchievements
        myAchievements = igorAchievements
        igorAchievements = intermediateVar
        
        // создание кортежа 3 и присваивание разницы
        let antonAchievements = (pushUps: (igorAchievements.pushUps - myAchievements.pushUps), pullUps: (igorAchievements.pullUps - myAchievements.pullUps), squats:(igorAchievements.squats - myAchievements.squats))
        // принт кортежа 3
        print("Достижения Антона: pushUps: \(antonAchievements.pushUps), pullUps: \(antonAchievements.pullUps), squats: \(antonAchievements.squats)")
    }

    // MARK: - TASK 5

    func task5() {
        print("-------------Task 5-------------")
        let song: String = "17"
        let album: String = "5"
        let cash: String = "35baks"
        let stars: String = "89"
        let age: String = "7age"
        // переменная с суммами всеx констант
        // nil-coalescing
        var sum = (Int(cash) ?? 0) + (Int(age) ?? 0)
        
        let cashCon = Int(cash)
        let ageCon = Int(age)
        
        // optional binding
        let songCon = Int(song)
        if let song = songCon {
            sum = sum + song
        }
        
        let starsCon = Int(stars)
        if let stars = starsCon {
            sum = sum + stars
        }
        // forced unwrapping
        let albumCon = Int(album)
        if albumCon != nil {
            sum += albumCon!
        }
        
        let string = "\(songCon!) + \(starsCon!) + \(String(describing: cashCon)) + \(albumCon!) + \(String(describing: ageCon)) = \(sum)"
        print(string)
    }
    
    
    // MARK: - Task 6
    
    func errorTask6() {
        print("-------------Task 6-------------")
        // с code
        let tupleMassege: MessageOrError = (Int.random(in: 200..<400), "Ошибки нету продолжайте", "Fatal Error!")
        if tupleMassege.code >= 200 && tupleMassege.code <= 300 {
            print(tupleMassege.message!)
        } else if tupleMassege.code >= 300 && tupleMassege.code <= 400{
            print(tupleMassege.errorMessage!)
        }
        
        // без code
        let tupleNonCode: NonCode = (nil, "Проверьте пароль")
        if tupleNonCode.message != nil {
            print(tupleNonCode.message!)
        } else if tupleNonCode.errorMessage != nil {
            print(tupleNonCode.errorMessage!)
        }
    }
    
    // MARK: - Task 8
    
    
    func task8() {
        print("-------------Task 8-------------")
        let intTuple: (int1: Int?, int2: Int?, int3: Int?, int4: Int?, int5: Int?) = (25, 3, 56, 11, 78)
        // optional binding
        var sumOptionalBinding = 0
        if let int1 = intTuple.int1 {
            sumOptionalBinding = sumOptionalBinding + int1
            }
        if let int2 = intTuple.int2 {
            sumOptionalBinding = sumOptionalBinding + int2
        }
        if let int3 = intTuple.int3 {
            sumOptionalBinding = sumOptionalBinding + int3
        }
        if let int4 = intTuple.int4 {
            sumOptionalBinding = sumOptionalBinding + int4
        }
        if let int5 = intTuple.int5 {
            sumOptionalBinding = sumOptionalBinding + int5
        }
        print("Optional binding sum: \(sumOptionalBinding)")
        
        // forced unwrapping
        var sumForcedUnwrapping = 0
        if intTuple.int1 != nil {
            sumForcedUnwrapping += intTuple.int1!
        }
        if intTuple.int2 != nil {
            sumForcedUnwrapping += intTuple.int2!
        }
        if intTuple.int3 != nil {
            sumForcedUnwrapping += intTuple.int3!
        }
        if intTuple.int4 != nil {
            sumForcedUnwrapping += intTuple.int4!
        }
        if intTuple.int5 != nil {
            sumForcedUnwrapping += intTuple.int5!
        }
        print("Forsed unwrapping sum: \(sumForcedUnwrapping)")
        
        // nil-coalescing
        var sumNilCoalecing = (intTuple.int1 ?? 0) + (intTuple.int2 ?? 0) + (intTuple.int3 ?? 0)
        sumNilCoalecing += (intTuple.int4 ?? 0) + (intTuple.int5 ?? 0)
        print("nil-coalescing sum : \(sumNilCoalecing)")
    }
}


// MARK: Extension for Task 7
extension ViewController {
    func butt() {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setTitle("Task 7", for: .normal)
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showTask7), for: .touchUpInside)
    }
    
    @objc private func showTask7() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let task7 = storyBoard.instantiateViewController(identifier: "task77") as! Task7
        self.present(task7, animated: true, completion: nil)
    }
}



