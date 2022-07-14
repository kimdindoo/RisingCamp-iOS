//
//  NewsCell.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/11.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var RnameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var contentsLabel: UILabel!
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
  
        // Create a new Attributed String
        let attributedString1 = NSMutableAttributedString.init(string: "\((RnameLabel.text)!)")
        
        // Add Underline Style Attribute.
        attributedString1.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString1.length));
        RnameLabel.attributedText = attributedString1
        
        // Create a new Attributed String
        let attributedString2 = NSMutableAttributedString.init(string: "\((locationLabel.text)!)")
        
        // Add Underline Style Attribute.
        attributedString2.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString2.length));
        locationLabel.attributedText = attributedString2
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 100, bottom: 100, right: 100))
//    }
    
    func configure(_ movieImageData: MovieImageData) {
        thumbNailImageView.image = UIImage(named: movieImageData.imageName)
        
//        RnameLabel.text = eatDealData.Rname
//        menuLabel.text = eatDealData.menu
    }
    
}
