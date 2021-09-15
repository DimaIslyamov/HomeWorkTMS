//
//  WheathreViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 15.09.21.
//

import UIKit

class WheathreViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var wheathreIconImage: UIImageView!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var feelsLike: UILabel!
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var backButtonImage: UIImageView!
    
    
    var city = ""
    
    var wheather: [Wheather] = [] {
        didSet {
            DispatchQueue.main.async {
                self.setWheather(self.wheather)
                print()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        HttpManager.shared.getWeather(getUrl()) { wheather in
            self.wheather = wheather
        }
        view.addSubview(setBackground(with: "WheathreBackground"))
    }
    
    private func getUrl() -> String {
        return "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(ApiKey.key.rawValue)&units=metric"
    }
    
    private func setWheather(_ wheather: [Wheather])  {
        guard !wheather.isEmpty else {
            print("city not found")
            return
        }
        for i in wheather {
            
            self.cityNameLable.text = i.city
            self.temperatureLable.text = "\(i.temp)"
            self.feelsLike.text = "\(Int(i.tempFeelsLike))"
            
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
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
