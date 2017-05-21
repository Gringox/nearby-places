//
//  NearbyPlacesInteractor.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation
import CoreLocation

class NearbyPlacesInteractor: NSObject, NearbyPlacesInteractorInterface {
    
    var locationManager: CLLocationManager!
    var location: CLLocation?
    
    override init() {
        super.init()
        self.determineMyCurrentLocation()
    }
    
    // MARK: - Getters
    
    internal func getLocation() -> CLLocation {
        return self.location!
    }
    
    // MARK: - CLLocation manager
    
    private func determineMyCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    internal func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
        let location: CLLocation = locations[0] as CLLocation
        
        self.location = location
        
//        print("user latitude = \(userLocation.coordinate.latitude)")
//        print("user longitude = \(userLocation.coordinate.longitude)")
        
        manager.stopUpdatingLocation()
    }
    
}
