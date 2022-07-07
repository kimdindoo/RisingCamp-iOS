//
//  LIfeCell.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/28.
//

import UIKit

class LIfeCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var repleLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
