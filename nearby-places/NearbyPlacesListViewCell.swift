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
        
        if let imageUrl = place.photoUrl as String? {
            self.nearbyPlaceImageView
                .sd_setImage(with: URL(string: imageUrl),
                             placeholderImage: UIImage(named: "place.png"))
        }else{
            self.nearbyPlaceImageView.image = UIImage(named: "place.png")
        }
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
