//
//  WeatherViewController.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 6.09.21.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var wheathreIconImage: UIImageView!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var cityLable: UILabel!
    
    var newtworWeatherManager = NewtworWeatherManager()
    var city = "Minsk"
    
    var currentWeatherData: [CurrentWeatherData] = [] {
        didSet {
            print()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NewtworWeatherManager.shared.getWheather(getTheCurrentWeather()) { wheather in
            self.currentWeatherData = wheather
        }
//        newtworWeatherManager.delegate = self
        view.addSubview(setBackground(with: "WheathreBackground"))
    }
    
    func getTheCurrentWeather() -> String {
        return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(ApiKey.apiKey.rawValue)&units=metric"
    }
    
//    func updateInterfaceWith(weather: CurrentWeather) {
//        DispatchQueue.main.async {
//            self.cityLable.text = weather.cityName
//            self.temperatureLable.text = weather.temperatureString
//            self.feelsLike.text = weather.feelsLikeTemperatureString
//            self.wheathreIconImage.image = UIImage(systemName: weather.iconImageNameString)
//        }
//    }
    
    
    
    @IBAction private func searchButton(_ sender: UIButton) {
//        presentSearchAlertController(withTitle: "Enter city name", massage: nil, style: .alert) { city in
//            self.cityLable.text = city
//        }
    }
    
    
}
