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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NearbyPlacesListViewFactory.initVIPERForNearbyPlacesListView(view: self)
        
        let cellNib: UINib = UINib.init(
            nibName: String(describing: NearbyPlacesListViewCell.self),
            bundle: nil
        )
        
        self.collectionView.register(
            cellNib,
            forCellWithReuseIdentifier: String(describing: NearbyPlacesListViewCell.self)
        )
        
        self.collectionView.delegate = self.presenter
        self.collectionView.dataSource = self.presenter
        
        self.presenter?.loadLocation()
    }
    
    // MARK: - Getters
    
    internal func viewController() -> UIViewController {
        return self;
    }
    
    internal func getCollectionView() -> UICollectionView {
        return self.collectionView;
    }

}
