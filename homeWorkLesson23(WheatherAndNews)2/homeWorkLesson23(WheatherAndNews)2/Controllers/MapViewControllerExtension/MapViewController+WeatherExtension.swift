//
//  MapViewController+WeatherExtension.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 27.09.21.
//

import UIKit

extension MapViewController {
    func getUrl() -> String {
       return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(ApiKey.key.rawValue)&units=metric"
   }
    
   
    func setWheather(_ wheather: [Wheather])  {
       guard !wheather.isEmpty else {
           print("Cordinate not found")
           return
       }
       for i in wheather {
        
           self.temperatureLable.text = "\(i.temp)°C"
           self.feelsLikeLable.text = "Feels Like"
           
           switch i.forecastId {
           case 200...232:
               return weatherImage.image = UIImage(named: "sunny")
           case 300...321:
               return weatherImage.image = UIImage(named: "drizzle")
           case 500...531:
               return weatherImage.image = UIImage(named: "rain")
           case 600...622:
               return weatherImage.image = UIImage(named: "snow")
           case 701...781:
               return weatherImage.image = UIImage(named: "smog")
           case 800:
               return weatherImage.image = UIImage(named: "sun")
           case 801...804:
               return weatherImage.image = UIImage(named: "clouds")
           default:
               return weatherImage.image = UIImage(named: "nosign")
           }
       }
   }
}
