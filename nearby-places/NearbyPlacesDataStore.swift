//
//  NearbyPlacesDataStore.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation

class NearbyPlacesDataStore: NSObject, NearbyPlacesDataStoreInterface {
    
    var places : [NearbyPlacesEntity] = [NearbyPlacesEntity]()
    
    internal func loadPlaces(successCallback: @escaping () -> (),
                             failureCallback: @escaping () -> ()) {
        
        NearbyPlacesRepository.loadPlaces(successCallback: { 
            successCallback();
        }, failureCallback: failureCallback)
        
    }

}
