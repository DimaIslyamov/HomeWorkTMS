//
//  NewtworWeatherManager.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 6.09.21.
//

import UIKit
import CoreLocation
import Alamofire

//protocol newtworWeatherManagerDelegate: AnyObject {
//    func updateInterface(_: NewtworWeatherManager, with currentWeather: CurrentWeather)
//}

//enum RequestType {
//    case cityName(city: String)
//    case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
//}

class NewtworWeatherManager {
    static let shared = NewtworWeatherManager()
    
    func getWheather(_ url: String, _ onCompletion: @escaping ([CurrentWeatherData]) -> Void) {
        AF.request(url, method: .get).response(queue: DispatchQueue.global(qos: .userInteractive)) { response in
            guard let data = response.data else { return }
            onCompletion(ParseManager.shared.pareseWeather(data))
        }
    }
    
    
//
//
    
//    weak var delegate: newtworWeatherManagerDelegate?
    
    
    // получнение текущей погоды
//    func getTheCurrentWeather(for requestType: RequestType) {
//        var urlString = ""
//        switch requestType {
//        case .cityName(let city):
//            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
//        case .coordinate(let latitude, let longitude):
//            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)}&lon=\(longitude)&apikey=\(apiKey)&units=metric"
//        }
//        performRequest(withURLString: urlString)
//    }
    
    
    // функция выполнения запроса
//    fileprivate func performRequest(withURLString urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { (data, response, error) in
//            if let data = data {
//                if let currentWeather = self.parseJSON(withData: data) {
//                    self.delegate?.updateInterface(self, with: currentWeather)
//                }
//            }
//        }
//        task.resume()
//    }
    
    
    // парс json данных
//     fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
//        let decoder = JSONDecoder()
//        do {
//            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
//            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
//                return nil
//            }
//            return currentWeather
//
//        } catch {
//            print("The incorrectly city name")
//        }
//
//        return nil
//    }
}
