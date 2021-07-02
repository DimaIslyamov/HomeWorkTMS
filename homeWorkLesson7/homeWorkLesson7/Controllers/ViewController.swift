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
            value.shipping(numberOfPassangers: 4, mileage: 340)
        }
        
        
        
    }


}

