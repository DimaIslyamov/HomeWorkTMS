//
//  Group.swift
//  homeWorkLesson6
//
//  Created by Moobat on 30.06.21.
//

import Foundation

class StudentsGroup {
    
    let groupName: String
    var juornal: [Students]
   
    
    init(groupName: String, juornal: [Students]) {
        self.groupName = groupName
        self.juornal = juornal
    }

    func printStudentGroup() {
        print("#\t\(groupName)")
        var count = 1
        for value in juornal {
            print("\(count)\t\(value.firstName)\t\(value.secondName)\t\(value.yearOfBirth)\t\(value.averageScore)")
            count += 1
        }
    }
    
    func deleteStudents(avergeScore: Int) {
        var deleteStu = juornal.count - 1
        while deleteStu > 0 {
            if juornal[deleteStu].averageScore < avergeScore {
                juornal.remove(at: deleteStu)
            }
            deleteStu -= 1
        }
    }
}
