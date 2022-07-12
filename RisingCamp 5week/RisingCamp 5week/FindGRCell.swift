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
    
 
    
 
    
    func configure(_ restaurangData: RestaurangData) {
        thumbnailImageView.image = UIImage(named: restaurangData.imageName)
        RNameLabel.text = restaurangData.Rname
        distanceLabel.text = restaurangData.distance
        viewerLabel.text = "\(restaurangData.viewer)"
        writtenLabel.text = "\(restaurangData.written)"
    }
    
}
