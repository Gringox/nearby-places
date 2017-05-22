//
//  NearbyPlacesDataStore.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation
import CoreLocation

class NearbyPlacesDataStore: NSObject, NearbyPlacesDataStoreInterface {
    
    var places : [NearbyPlacesEntity] = [NearbyPlacesEntity]()
    
    // MARK: - Services
    
    internal func loadPlacesForLocation(location: CLLocation,
                                        successCallback: @escaping () -> (),
                                        failureCallback: @escaping () -> ()) {
        
        NearbyPlacesRepository.loadPlacesForLocation(location: location,
        successCallback: { (places) in
            self.places = places
            successCallback()
        }, failureCallback: failureCallback)
    }
    
    // MARK: - DataStore
    
    internal func getNumberOfPlaces() -> Int {
        return self.places.count
    }
    
    internal func getPlaceAtIndex(index: Int) -> NearbyPlacesEntity {
        return self.places[index]
    }
    
}
