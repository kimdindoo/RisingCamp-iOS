//
//  FindGRCell.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class FindGRCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    @IBOutlet weak var RNameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var viewerLabel: UILabel!
    
    @IBOutlet weak var writtenLabel: UILabel!
    
    func configure(_ restaurantInfo: RestaurangtInfo) {
        thumbnailImageView.image = UIImage(named: restaurantInfo.imageName)
        RNameLabel.text = restaurantInfo.Rname
        distanceLabel.text = restaurantInfo.distance
        viewerLabel.text = "\(restaurantInfo.viewer)"
        writtenLabel.text = "\(restaurantInfo.written)"
    }
    
}
