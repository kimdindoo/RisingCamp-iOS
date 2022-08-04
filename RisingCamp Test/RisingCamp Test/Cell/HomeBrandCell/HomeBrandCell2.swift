//
//  HomeBrandCell2.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import UIKit

class HomeBrandCell2: UITableViewCell {
    
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandEnNameLabel: UILabel!
    @IBOutlet weak var productNumLabel: UILabel!
    
    override func awakeFromNib() {
        brandImageView.layer.cornerRadius = brandImageView.frame.width / 2
        brandImageView.clipsToBounds = true
    }
    
}
