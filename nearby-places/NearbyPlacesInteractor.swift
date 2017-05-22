//
//  NearbyPlacesInteractor.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftLocation

class NearbyPlacesInteractor: NSObject, NearbyPlacesInteractorInterface {
    
    internal func getCurrentLocation(successCallback: @escaping (CLLocation) -> (),
                                     failureCallback: @escaping () -> ()) {
        Location.getLocation(accuracy: .room, frequency: .oneShot,
        success: { _, location in
            successCallback(location)
        }) { (_, last, error) in
            failureCallback();
        }
    }
    
}
