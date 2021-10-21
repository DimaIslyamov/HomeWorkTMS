//
//  MapViewController.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 25.09.21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var streetNameLable: UILabel!
    @IBOutlet weak var feelsLikeLable: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    
    
    let locationManager = CLLocationManager()
    let _anatation = MKPointAnnotation()
    var dispatchWorkItem: DispatchWorkItem?
    
    var city = ""
    var wheather: [Wheather] = [] {
        didSet {
            DispatchQueue.main.async {
                self.setWheather(self.wheather)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.showsUserLocation = true
        mapView.delegate = self
        _anatation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(_anatation)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLocation { result in
            guard result else { return }
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.delegate = self
            self.locationManager.startUpdatingLocation()
        }
    }
    
    
    
    func setupLocation(_ completion: (Bool) -> ()) {
        guard CLLocationManager.locationServicesEnabled() else {
            completion(false)
            return
        }
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            completion(true)
        case .denied:
            completion(false)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default: break
        }
    }
    
    
    
    func showSettingsAlertController() {
        let alert = UIAlertController(title: nil, message: "Вам нужно разрешить отслеживание вашей геопозиции, перейдите в настойки", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settings = UIAlertAction(title: "Settings", style: .default) { _ in
            guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(settings)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func updateLocation(_ sender: UIButton) {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
        case .denied, .restricted:
            showSettingsAlertController()
            print("denied")
        default: break
        }
    }

}
