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
                                     successCallback: @escaping () -> (),
                                     failureCallback: @escaping () -> ()) {
        
        Alamofire.request("https://httpbin.org/get").validate().responseJSON { response in
            switch response.result {
            case .success:
                if let json = response.result.value {
                    print("JSON: \(json)")
                    successCallback();
                }else{
                    failureCallback();
                }
            case .failure(_):
                failureCallback()
            }
        }
        
    }

}
