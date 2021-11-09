//
//  Date+Format.swift
//  homeWorkLesson10
//
//  Created by Moobat on 28.08.21.
//

import UIKit

extension Date {
    var currentDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
    
    func getCurrentDate(from dateFormat: String = "MMM d, yyyy") -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
