//
//  LoginCell.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/17.
//

import UIKit

class LoginCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionLabel2: UILabel!
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func configure(_ info: LoginBannerInfo) {
        titleLabel.text = info.title
        titleLabel2.text = info.title2
        descriptionLabel.text = info.description
        descriptionLabel2.text = info.description2
        thumbnailImageView.image = UIImage(named: info.imageName)
    }


}
