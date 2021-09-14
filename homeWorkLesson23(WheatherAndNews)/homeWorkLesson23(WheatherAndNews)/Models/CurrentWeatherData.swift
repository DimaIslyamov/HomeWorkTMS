//
//  CurrentWeatherData.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 6.09.21.
//

import UIKit

class CurrentWeatherData {
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

//struct CurrentWeatherData {
//    let name: String
//    let main: Main
//    let weather: [Weather]
//
//    init(name: String, main: Main, weather: [Weather]) {
//        self.name = name
//        self.main = main
//        self.weather = weather
//    }
//}
//
//struct Main {
//    let temp: Double
//    let feelsLike: Double
//
//    enum CodingKeys: String {
//        case temp
//        case feelsLike = "feels_like"
//    }
//}
//
//struct Weather {
//    let id: Int
//}
