//
//  Table1Cell.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/28.
//

import UIKit

class Table1Cell: UITableViewCell {

    
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var imageView3: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
