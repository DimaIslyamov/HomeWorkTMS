//
//  Group.swift
//  homeWorkLesson6
//
//  Created by Moobat on 30.06.21.
//

import Foundation

class Students {
    
    let firstName: String
    let secondName: String
    let yearOfBirth: Int
    let averageScore: Int
    
    init(name: String, secondName: String, yearOfBirth: Int, averageScore: Int) {
        self.firstName = name
        self.secondName = secondName
        self.yearOfBirth = yearOfBirth
        self.averageScore = averageScore
    }
}
