//
//  Wheather.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit

class Wheather {
    var temp: Int
    var tempFeelsLike: Int
    var forecastId: Int
    var forecast: String
    var city: String

    init(temp: Int, tempFeelsLike: Int, forecastId: Int, forecast: String, city: String) {
        self.temp = temp
        self.tempFeelsLike = tempFeelsLike
        self.forecastId = forecastId
        self.forecast = forecast
        self.city = city
    }
}
