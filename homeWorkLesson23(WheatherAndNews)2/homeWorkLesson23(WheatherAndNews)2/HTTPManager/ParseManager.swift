//
//  ParseManager.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit
import SwiftyJSON

class ParseManager {
    
    static let shared = ParseManager()
    
    func pareseWeather(_ data: Data) -> [Wheather] {
        var wheatherArray: [Wheather] = []
        guard let json = try? JSON(data: data), json["cod"].intValue != 404 else { return [] }
        
        var forecast = ""
        let tem = json["main"]["temp"].intValue
        let feelsLike = json["main"]["feels_like"].intValue
        var forecastId = json["weather"]
        for i in forecastId {
            let u = i.1
            forecastId = u["id"]
            forecast = u["description"].rawValue as! String
        }
        let city = json["name"].string
        
        wheatherArray.append(Wheather(temp: tem,
                                      tempFeelsLike: feelsLike,
                                      forecastId: forecastId.rawValue as? Int ?? 0,
                                      forecast: forecast,
                                      city: city ?? ""))
        return wheatherArray
    }
}
