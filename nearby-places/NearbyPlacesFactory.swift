//
//  NearbyPlacesFactory.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation

class NearbyPlacesFactory: NSObject {
    
    class func initNearbyPlacesDataStore() -> NearbyPlacesDataStoreInterface {
        return NearbyPlacesDataStore()
    }
    
    class func initNearbyPlacesInteractor() -> NearbyPlacesInteractorInterface {
        return NearbyPlacesInteractor()
    }

}
