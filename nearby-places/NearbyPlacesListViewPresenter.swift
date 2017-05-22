//
//  NearbyPlacesListViewPresenter.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit
import CoreLocation

class NearbyPlacesListViewPresenter: NSObject, NearbyPlacesListViewPresenterInterface {
    
    var view: NearbyPlacesListViewInterface?
    var dataStore: NearbyPlacesDataStoreInterface?
    var interactor: NearbyPlacesInteractorInterface?
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 30.0,
                                                 left: 10.0,
                                                 bottom: 30.0,
                                                 right: 10.0)
    
    fileprivate let itemsPerRow: CGFloat = 2
    
    // MARK: - Services
    
    internal func loadLocation() {
        
        let success = {(location: CLLocation) -> () in
            self.loadNearbyPlacesFor(location: location)
        }
        
        let failure = {() -> () in
            print("fallo")
        }

        self.interactor?.getCurrentLocation(successCallback: success,
                                            failureCallback: failure)
    }
    

    private func loadNearbyPlacesFor(location: CLLocation) {
    
        let success = {() -> () in
            self.view?.getCollectionView().reloadData()
        }
        
        let failure = {() -> () in
            print("fallo")
        }
        
        self.dataStore?.loadPlacesForLocation(location: location,
                                              successCallback: success,
                                              failureCallback: failure)
    }
    
    // MARK: - Collection View DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return (self.dataStore?.getNumberOfPlaces())!;
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let cell : NearbyPlacesListViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: NearbyPlacesListViewCell.self),
            for: indexPath
        ) as! NearbyPlacesListViewCell
        
        let place = self.dataStore?.getPlaceAtIndex(index: indexPath.row)
        
        cell.initCellWithPlace(place: place!)
        
        return cell
    }
    
    // MARK: - Collection View Flow Layout Delegate
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let view = self.view?.viewController().view
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = (view?.frame.width)! - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    // MARK: - Collection View Delegate
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
    }

}
