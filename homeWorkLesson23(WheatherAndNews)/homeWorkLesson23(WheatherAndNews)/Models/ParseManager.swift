//
//  ParseManager.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 14.09.21.
//

import UIKit
import SwiftyJSON

class ParseManager {
    static let shared = ParseManager()
    
    func pareseWeather(_ data: Data) -> [CurrentWeatherData] {
        var wheatherArray: [CurrentWeatherData] = []
        guard let json = try? JSON(data: data), json["code"].intValue != 404 else { return [] }
        
        var  forecast = ""
        let temp = json["main"]["temp"].intValue
        let tempfeelslike = json["main"]["feels_like"].intValue
        var forecastId = json["weather"]
        for i in forecastId { let u = i.1
            forecastId = u["id"]
            forecast = u["description"].rawValue as! String
        }
        let city = json["name"].string
        
        wheatherArray.append(CurrentWeatherData(temp: temp,
                                                tempFeelsLike: tempfeelslike,
                                                forecastId: forecastId.rawValue as! Int,
                                                forecast: forecast,
                                                city: city ?? ""))
        return wheatherArray
    }
}

