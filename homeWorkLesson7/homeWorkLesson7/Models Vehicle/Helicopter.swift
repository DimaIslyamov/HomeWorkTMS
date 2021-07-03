//
//  Helicopter.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation


class Helicopter: Vehicle {
    private let helicopter = "Вертолет: "
    
    override init(speed: Int, capacity: Int, costOmeKilometer: Double) {
        super.init(speed: speed, capacity: capacity, costOmeKilometer: costOmeKilometer)
    }
    
    override func shipping(numberOfPassangers: Int, mileage: Double) -> String{
        let value = super.shipping(numberOfPassangers: numberOfPassangers, mileage: mileage)
        return helicopter + value
    }
    
}
