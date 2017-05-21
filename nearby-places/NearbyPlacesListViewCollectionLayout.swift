//
//  NearbyPlacesListViewCollectionLayout.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit

class NearbyPlacesListViewCollectionLayout: UICollectionViewFlowLayout {
    
    override init() {
        
        super.init()
        
        self.minimumLineSpacing = 1.0
        self.minimumInteritemSpacing = 1.0
        self.scrollDirection = .vertical
        
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    func setup() {
        let numberOfColumns: CGFloat = 2
        print(self.collectionView!)
        let itemWidth: CGFloat? = ((self.collectionView?.frame.width)! -
            (numberOfColumns - 1)) / numberOfColumns
        self.itemSize = CGSize(width: CGFloat(itemWidth!), height: CGFloat(itemWidth!))
    }

}
