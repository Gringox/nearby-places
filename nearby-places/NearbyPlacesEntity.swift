//
//  NearbyPlacesEntity.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation

class NearbyPlacesEntity: NSObject {
    
    var name: String?
    var photoUrl: String?
    
    class func initPlaceFrom(name placeName: String,
                             usingPhotos photos: [[String:Any]]?) -> NearbyPlacesEntity? {
        
        let place: NearbyPlacesEntity = NearbyPlacesEntity()
        
        place.name = placeName
        
        if let photosArray = photos as [[String:Any]]? {
            guard let photoReference = photosArray[0]["photo_reference"] as! String? else {
                return nil
            }
            
            var photoUrl = NearbyPlacesAppDefaults.API_URL + "photo?"
            photoUrl = photoUrl + "maxwidth=400&maxheight=400"
            photoUrl = photoUrl + "&photoreference=" + photoReference
            photoUrl = photoUrl + "&key=" + NearbyPlacesAppDefaults.API_KEY
            place.photoUrl = photoUrl
        }
        
        return place
    }
    
    class func initPlacesFromPlacesArray(
        placesRawArray: [[String:Any]]) -> [NearbyPlacesEntity]? {
    
        var places: [NearbyPlacesEntity] = [NearbyPlacesEntity]()
        
        for rawPlace in placesRawArray {
            
            guard let name = rawPlace["name"] as! String? else {
                return nil
            }
            
            let photos = rawPlace["photos"] as! [[String:Any]]?
            
            guard let place = NearbyPlacesEntity.initPlaceFrom(name: name,
                                                               usingPhotos: photos) else {
                return nil
            }
            places.append(place)
            
        }
        
        return places
    }

}
