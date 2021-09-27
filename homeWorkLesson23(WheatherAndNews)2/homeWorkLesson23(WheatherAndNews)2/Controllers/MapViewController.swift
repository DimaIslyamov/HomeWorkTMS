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
    
    var userLocation: CLLocationCoordinate2D?
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    
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
    

}
