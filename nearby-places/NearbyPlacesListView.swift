//
//  NearbyPlacesListView.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class NearbyPlacesListView: UIViewController, NearbyPlacesListViewInterface {
    
    var presenter: NearbyPlacesListViewPresenterInterface?

    override func viewDidLoad() {
        super.viewDidLoad()

        NearbyPlacesListViewFactory.initVIPERForNearbyPlacesListView(view: self)
    }

}
