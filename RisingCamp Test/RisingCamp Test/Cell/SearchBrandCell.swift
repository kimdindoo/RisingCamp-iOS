//
//  SearchBrandCell.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/19.
//

import UIKit

class SearchBrandCell: UITableViewCell {

    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var brandKoNameLabel: UILabel!
    
    @IBOutlet weak var brandEnNameLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 2
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.layer.borderWidth = 0.5
        thumbnailImageView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }

    func configure(_ info: SearchBrand) {
        brandKoNameLabel.text = info.koreanName
        brandEnNameLabel.text = info.englishName
        amountLabel.text = "\(info.productNum)"
        thumbnailImageView.image = UIImage(named: info.imageURL)
    }
    
    func configure2(_ info: BrandList) {
        brandKoNameLabel.text = info.koreanName
        brandEnNameLabel.text = info.englishName
        amountLabel.text = "\(info.productNum)"
        thumbnailImageView.image = UIImage(named: info.imageURL)
    }


}
