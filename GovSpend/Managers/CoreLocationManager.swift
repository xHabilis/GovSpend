//
//  CoreLocationModel.swift
//  GovSpend
//
//  Created by Isaac M on 9/3/21.
//

import Foundation
import SwiftUI
import CoreLocation

enum Alerts {
    case locationDisabled, locationDenied, locationRestricted
}

class CoreLocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var isRestricted: Bool = false
    @Published var isDenied: Bool = false
    @Published var isDisabled: Bool = false
    
    
    var locationManager: CLLocationManager?
    var theAddress: String?
    
    
    func checkForLocationServices() {
        if CLLocationManager.locationServicesEnabled() {

            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
            
        } else {
            isDisabled = true
        }
    }
    
    //Check for Permissions
    func checkForAuthorization() {
        
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
        
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .restricted:
        isRestricted = true
            
        case .denied:
        isDenied = true
                
        case .authorizedAlways, .authorizedWhenInUse:
            
            //Get location and Convert to Standard address
            if let theLocation = locationManager.location?.coordinate {
                let geocoder = CLGeocoder()
                
                let lat = theLocation.latitude
                let lon = theLocation.longitude
                let locationAsAddress = CLLocation(latitude: lat, longitude: lon)

                geocoder.reverseGeocodeLocation(locationAsAddress) { (placemark, error) in
                    if let userLocation = placemark?.first {
                        self.theAddress = userLocation.administrativeArea
                    }
                    
                }
            }
            
        @unknown default:
            break
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkForAuthorization()
        
    }
    
}
