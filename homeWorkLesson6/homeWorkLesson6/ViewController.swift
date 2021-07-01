//
//  ViewController.swift
//  homeWorkLesson6
//
//  Created by Moobat on 30.06.21.
//

import UIKit

class ViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let student1: Students = Students(name: "Dmitry",
                                          secondName: "Oksev",
                                          yearOfBirth: 1993,
                                          averageScore: 7)
        let student2: Students = Students(name: "Nikolai",
                                          secondName: "Drozd",
                                          yearOfBirth: 1990,
                                          averageScore: 4)
        let student3: Students = Students(name: "Andrey",
                                          secondName: "Zukau",
                                          yearOfBirth: 1996,
                                          averageScore: 8)
        let student4: Students = Students(name: "Anton",
                                          secondName: "Lesik",
                                          yearOfBirth: 1996,
                                          averageScore: 2)
        let student5: Students = Students(name: "Ilia",
                                          secondName: "Boyko",
                                          yearOfBirth: 1999,
                                          averageScore: 9)
        
        let studentGroup = StudentsGroup(groupName: "Mat - 5", juornal: [student1, student2, student3, student4, student5])
        
        studentGroup.printStudentGroup()
        studentGroup.deleteStudents(avergeScore: 8)
        studentGroup.printStudentGroup()
    }

    
    
}

