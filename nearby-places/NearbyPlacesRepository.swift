//
//  NearbyPlacesRepository.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class NearbyPlacesRepository: NSObject {
    
    class func loadPlacesForLocation(location: CLLocation,
                                     successCallback: @escaping ([NearbyPlacesEntity]) -> (),
                                     failureCallback: @escaping () -> ()) {
        
        let url = NearbyPlacesRepository
            .getURLWithQueryStringForLocation(location: location)
        
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success:
                
                if let json = response.result.value as! [String:Any]? {
                    
                    guard let results = json["results"] as! [[String:Any]]? else {
                        return failureCallback()
                    }
                    
                    guard let places = NearbyPlacesEntity
                        .initPlacesFromPlacesArray(placesRawArray: results) else {
                        return failureCallback();
                    }
                    
                    successCallback(places);
                }else{
                    failureCallback();
                }
            case .failure(_):
                failureCallback()
            }
        }
        
    }
    
    private class func getURLWithQueryStringForLocation(location: CLLocation) -> String {
        
        let apiKey = NearbyPlacesAppDefaults.API_KEY
        let apiUrl = NearbyPlacesAppDefaults.API_URL + "nearbysearch/json"
        let radius = NearbyPlacesAppDefaults.RADIUS
        
        var url = apiUrl + "?key=" + apiKey + "&radius=" + radius
        url = url + "&location=" + "\(location.coordinate.latitude)" + ","
        url = url + "\(location.coordinate.longitude)"
        
        print("url: ", url)
        
        return url
    }

}
