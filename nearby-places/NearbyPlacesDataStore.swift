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
    
    var nextPageToken: String?
    
    // MARK: - Services
    
    internal func loadPlacesForLocation(location: CLLocation,
                                        successCallback: @escaping () -> (),
                                        failureCallback: @escaping () -> ()) {
        
        if let token = self.nextPageToken as String? {
            if token == "" {
                return successCallback()
            }
        }
        
        NearbyPlacesRepository.loadPlacesForLocation(
        location: location,
        nextPageToken: self.nextPageToken,
        successCallback: { (places, nextPageToken) in
            self.nextPageToken = nextPageToken
            self.places.append(contentsOf: places)
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
