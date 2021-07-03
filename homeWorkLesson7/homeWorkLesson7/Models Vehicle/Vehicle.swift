//
//  Vehicle.swift
//  homeWorkLesson7
//
//  Created by Moobat on 2.07.21.
//

import Foundation

class Vehicle {
    
    let speed: Int
    let capacity: Int
    let costOmeKilometer: Double
    
    init(speed: Int, capacity: Int, costOmeKilometer: Double) {
        self.speed = speed
        self.capacity = capacity
        self.costOmeKilometer = costOmeKilometer
    }
    
    func shipping(numberOfPassangers: Int, mileage: Double) -> String{
        let time = Int(mileage) / speed
        
        let sum = costOmeKilometer * mileage
        
        let count: Int
        if numberOfPassangers % capacity == 0 {
            count = numberOfPassangers / capacity
        } else {
            count = (numberOfPassangers / capacity) + 1
        }
        
        return "Время в пути составит: \(time)ч. Стоимость перевозки за заданный километраж: \(Int(sum))р. Количество транспортных средств для осуществления маршрута: \(count)"
    }
}


