//
//  WheathreViewController+CorKit.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 16.09.21.
//

import UIKit

extension WheathreViewController {
     func getUrl() -> String {
        return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(ApiKey.key.rawValue)&units=metric"
    }
    
    
    
     func setWheather(_ wheather: [Wheather])  {
        guard !wheather.isEmpty else {
            print("city not found")
            return
        }
        for i in wheather {
            
            self.cityNameLable.text = i.city
            self.temperatureLable.text = "\(i.temp)°C"
            self.tempInt = i.temp
            self.feelsLike.text = "\(i.tempFeelsLike)°C"
            
            switch i.forecastId {
            case 200...232:
                return wheathreIconImage.image = UIImage(named: "sunny")
            case 300...321:
                return wheathreIconImage.image = UIImage(named: "drizzle")
            case 500...531:
                return wheathreIconImage.image = UIImage(named: "rain")
            case 600...622:
                return wheathreIconImage.image = UIImage(named: "snow")
            case 701...781:
                return wheathreIconImage.image = UIImage(named: "smog")
            case 800:
                return wheathreIconImage.image = UIImage(named: "sun")
            case 801...804:
                return wheathreIconImage.image = UIImage(named: "clouds")
            default:
                return wheathreIconImage.image = UIImage(named: "nosign")
            }
        }
    }
    
    
    func presentSearchAlertController() {
        self.view.addBlurView()
        let alertController = UIAlertController(title: "Enter city name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { tf in
            tf.placeholder = "enter city name"
            tf.returnKeyType = .done
        }
        let search = UIAlertAction(title: "Search",
                                   style: .default) { _ in
            guard let fields = alertController.textFields, fields.count == 1 else { return }
            let searchTextField = fields[0]
            guard let firstField = searchTextField.text, !firstField.isEmpty else { return }
            self.city = firstField
            HttpManager.shared.getWeather(self.getUrl()) { wheather in
                self.wheather = wheather
            }
            self.lableFeelsLikeText.text = "Feels Like"
            self.view.removeBlurView()
            
        }
        
        let cancel = UIAlertAction(title: "Cancel",
                                   style: .cancel) { _ in
            self.view.removeBlurView()
        }
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func settuoForSSButton() {
        followButton.frame = CGRect(x: 50, y: 680, width: 300, height: 30)
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitle("Following", for: .selected)
        followButton.addTarget(self, action: #selector(buttonDidPress(_:)), for: .touchUpInside)
        
        self.view.addSubview(followButton)
    }
}
