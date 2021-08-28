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
        dateFormatter.dateFormat = "dd MMMM yyyy"
        return dateFormatter.string(from: self)
    }
    
    func getCurrentDate(from dateFormat: String = "dd MMMM yyyy HH:mm:ss",
                        locale : Locale = .current,
                        timeZone: TimeZone = .current) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = locale
        dateFormatter.timeZone = timeZone
        return dateFormatter.string(from: self)
    }
}
