//
//  NearbyPlacesListViewCell.swift
//  nearby-places
//
//  Created by Pedro Luis Valdivieso on 5/21/17.
//  Copyright © 2017 Pedro Luis Valdivieso. All rights reserved.
//

import UIKit
import SDWebImage

class NearbyPlacesListViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nearbyPlaceImageView: UIImageView!
    @IBOutlet weak var nearbyPlaceLabel: UILabel!
    
    // MARK: - Initializer
    
    func initCellWithPlace(place: NearbyPlacesEntity) {
        
        self.nearbyPlaceLabel.text = place.name
        
        self.nearbyPlaceImageView
            .sd_setImage(with: URL(string: place.photoUrl!),
                         placeholderImage: UIImage(named: "place.png"))
    }
    
    // MARK: - UI Stuff

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 0.5;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1;
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1;
    }

}
