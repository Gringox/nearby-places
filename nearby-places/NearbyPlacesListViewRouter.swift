//
//  NearbyPlacesListViewRouter.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class NearbyPlacesListViewRouter: NSObject, NearbyPlacesListViewRouterInterface {
    
    internal func presentVC(toVC: UIViewController, fromVC: UIViewController) {
        fromVC.present(toVC, animated: true, completion: nil)
    }

}
