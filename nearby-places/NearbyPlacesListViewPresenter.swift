//
//  NearbyPlacesListViewPresenter.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class NearbyPlacesListViewPresenter: NSObject, NearbyPlacesListViewPresenterInterface {
    
    var view: NearbyPlacesListViewInterface?
    var dataStore: NearbyPlacesDataStoreInterface?
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 30.0,
                                                 left: 10.0,
                                                 bottom: 30.0,
                                                 right: 10.0)
    
    fileprivate let itemsPerRow: CGFloat = 3
    
    // MARK: - Collection View DataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let cell : NearbyPlacesListViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: NearbyPlacesListViewCell.self),
            for: indexPath
        ) as! NearbyPlacesListViewCell
        
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
