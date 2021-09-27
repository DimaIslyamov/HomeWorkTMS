//
//  MapViewController+MapDelegate.swift
//  homeWorkLesson23(WheatherAndNews)2
//
//  Created by Moobat on 27.09.21.
//

import UIKit
import MapKit
import CoreLocation



extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _ = locations.first?.coordinate else { return }
    }
}



extension MapViewController: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        _anatation.coordinate = mapView.centerCoordinate
        
        self.cityNameLable.text = "......"
        self.streetNameLable.text = "...."
        
        self.dispatchWorkItem?.cancel()
        self.dispatchWorkItem = DispatchWorkItem {
            
            guard self.dispatchWorkItem?.isCancelled == false else { return }
            let location = CLLocation(latitude: self.mapView.centerCoordinate.latitude,
                                      longitude: self.mapView.centerCoordinate.longitude)
            
            CLGeocoder().reverseGeocodeLocation(location) { placemark, error in
                if let _ = error {
                    print("Error.....")
                } else {
                    guard let place = placemark?.first else { return }
                    let countryAndCity = "\(place.country ?? ""), \(place.city ?? "")"
                    let streetNameNumber = "\(place.streetName ?? "")  \(place.streetNumber ?? "")"
                    
                    self.cityNameLable.text = countryAndCity
                    self.streetNameLable.text = streetNameNumber
                    
                    HttpManager.shared.getWeather(self.getUrl()) { wheather in
                        self.wheather = wheather
                    }
                }
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: self.dispatchWorkItem!)
    }
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//      set image for annotation
//    }
}
