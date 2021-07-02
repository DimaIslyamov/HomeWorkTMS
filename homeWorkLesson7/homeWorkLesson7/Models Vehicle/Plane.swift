//
//  Plane.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation


class Plane: Vehicle {
    private let plane = "Самолет: ✈️"
    
    override init(speed: Int, capacity: Int, costOmeKilometer: Double) {
        super.init(speed: speed, capacity: capacity, costOmeKilometer: costOmeKilometer)
    }
    
    override func shipping(numberOfPassangers: Int, mileage: Double) {
        print(plane)
        super.shipping(numberOfPassangers: numberOfPassangers, mileage: mileage)
    }
    
}
