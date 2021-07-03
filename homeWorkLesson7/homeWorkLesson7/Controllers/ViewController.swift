//
//  ViewController.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Task 1
        let dancer = Dancer(name: "Jastin", surName: "Timberlake")
        let singer = Singer(name: "Oliver", surName: "Sykes")
        let actor = Actor(name: "Johnny", surName: "Depp")
        let painter = Painter(painterArtisticName: "Banksy", name: nil, surName: nil)

        let massArtist: [Artist] = [dancer, singer, actor, painter]
        for value in massArtist {
            print("\(value.performance())")
        }
        
        //MARK: - Task 2
        let plane = Plane(speed: 245, capacity: 20, costOmeKilometer: 180)
        let ship = Ship(speed: 160, capacity: 40, costOmeKilometer: 210)
        let helicopter = Helicopter(speed: 120, capacity: 6, costOmeKilometer: 120)
        let car = Car(speed: 60, capacity:4, costOmeKilometer: 50)
        
        let massVehicle: [Vehicle] = [plane, ship, helicopter, car]
        for value in massVehicle {
            print("\(value.shipping(numberOfPassangers: 20, mileage: 240))")
        }
        
        //MARK: - Task 3
//          Создайте 5 классов: люди, крокодилы, обезьяны, собаки, жирафы.
//        - Создайте по пару объектов каждого класса и положите всех в один массив.
//        - Пройдите по массиву и выведите
//        - Сколько четвероногих?
//        - Сколько здесь животных?
//        - Сколько живых существ?
        
        // явно не так сделал, но это уже третий вариант и он хотябы зарабоатл =)
        
        let human1 = Humans()
        let human2 = Humans()
        let mops = Dogs()
        let korgi = Dogs()
        let chimpanzee = Monkey()
        let bonobo = Monkey()
        let aligator = Crocodiles()
        let australianAligator = Crocodiles()
        let africanGiraffe = Giraffe()
        let numibianGiraffe = Giraffe()
        
        let massCreatures = [human1, mops, human2, korgi, chimpanzee, aligator, bonobo, australianAligator, africanGiraffe, numibianGiraffe]
        
        let fourLeggeds = massCreatures.filter({$0 is FourLegged})
        let animalsCreatures = massCreatures.filter({$0 is Animals})
        
        print("Четвероногих: \(fourLeggeds.count), Животных: \(animalsCreatures.count), Живых существ: \(massCreatures.count)")
        
    }

}

