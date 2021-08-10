//
//  Students.swift
//  homeWorkLesson16
//
//  Created by Moobat on 9.08.21.
//
//
import UIKit

class Students {
    
    let name: String
    let avgMark: Double = Double.random(in: 1.0..<5.0)
    
    init(name:String) {
        self.name = name
    }
    
}
