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
    
    func shipping(numberOfPassangers: Int, mileage: Double) {
        
        let time = Int(mileage) / speed
        print("Время в пути составит: \(time)ч")
        
        let sum = costOmeKilometer * mileage
        print("Стоимость перевозки за заданный километраж: \(Int(sum))р.")
        
        // нужна формула !
//        let countVehicle = capacity * numberOfPassangers / 70
//        print("количество необходимых транспортных средств: \(countVehicle) ")
        if  numberOfPassangers <= capacity {
            print("Это транспортное средство подойдет")
        } else if numberOfPassangers > capacity {
            print("Вам нужно больше транспортных средств")
        }
        
    }
}


