//
//  NearbyPlacesInteractorInterface.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation
import CoreLocation

protocol NearbyPlacesInteractorInterface: CLLocationManagerDelegate {
    func getLocation() -> CLLocation;
}
