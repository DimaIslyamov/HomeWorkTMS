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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newtworWeatherManager.delegate = self
        view.addSubview(setBackground(with: "WheathreBackground"))
    }
    
    
    
    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLable.text = weather.cityName
            self.temperatureLable.text = weather.temperatureString
            self.feelsLike.text = weather.feelsLikeTemperatureString
            self.wheathreIconImage.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
    
    
    
    @IBAction private func searchButton(_ sender: UIButton) {
        presentSearchAlertController(withTitle: "Enter city name", massage: nil, style: .alert) { city in
            self.newtworWeatherManager.getTheCurrentWeather(for: .cityName(city: city))
        }
    }
    
    
}
