//
//  WeatherViewController+NWMDelegate.swift
//  homeWorkLesson23(WheatherAndNews)
//
//  Created by Moobat on 6.09.21.
//

import UIKit
import CoreLocation

extension WeatherViewController: newtworWeatherManagerDelegate {
    func updateInterface(_: NewtworWeatherManager, with currentWeather: CurrentWeather) {
        self.updateInterfaceWith(weather: currentWeather)
    }
}
