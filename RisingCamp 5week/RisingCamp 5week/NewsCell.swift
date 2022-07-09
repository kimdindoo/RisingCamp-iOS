//
//  NewsCell.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var RnameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func configure(_ eatDealData: EatDealData) {
        thumbnailImageView.image = UIImage(named: eatDealData.imageName)
        RnameLabel.text = eatDealData.Rname
        menuLabel.text = eatDealData.menu
    }

}
