//
//  NearbyPlacesListViewFactory.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import Foundation

class NearbyPlacesListViewFactory: NSObject {
    
    class func initVIPERForNearbyPlacesListView(view: NearbyPlacesListView) {
        view.presenter = NearbyPlacesListViewFactory.initPresenterWithView(view: view)
    }
    
    private class func initPresenterWithView(view: NearbyPlacesListView) -> NearbyPlacesListViewPresenterInterface {
        let presenter = NearbyPlacesListViewPresenter()
        presenter.view = view
        presenter.dataStore = NearbyPlacesFactory.initNearbyPlacesModule()
        return presenter
    }

}
