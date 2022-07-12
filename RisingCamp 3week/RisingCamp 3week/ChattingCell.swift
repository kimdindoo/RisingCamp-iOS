//
//  ChattingCell.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/28.
//

import UIKit

class ChattingCell: UITableViewCell {
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var messeageLabel: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
