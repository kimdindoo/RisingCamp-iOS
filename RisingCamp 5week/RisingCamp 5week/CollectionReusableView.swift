//
//  CollectionReusableView.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/12.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var distanceButton: UIButton!
    @IBOutlet weak var filterButton: UIButton!
    
    override func awakeFromNib() {
        
        distanceButton.layer.cornerRadius = 13
        distanceButton.clipsToBounds = true
        
        filterButton.layer.cornerRadius = 13
        filterButton.clipsToBounds = true
        filterButton.layer.borderWidth = 0.5
        filterButton.layer.borderColor = UIColor.darkGray.cgColor
    }
}
