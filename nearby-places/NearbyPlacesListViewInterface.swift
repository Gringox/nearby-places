//
//  NearbyPlacesListViewInterface.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

protocol NearbyPlacesListViewInterface {
    
    func viewController() -> UIViewController
    
    func getCollectionView() -> UICollectionView
    
}
