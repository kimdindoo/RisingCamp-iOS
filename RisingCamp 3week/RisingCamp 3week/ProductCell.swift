//
//  ProductCell.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/27.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var proudctName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var uploadTime: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 
    
    func setCell(product: ProductList) {
        proudctName.text = product.name
        location.text = product.location
        uploadTime.text = product.uploadTime
        productPrice.text = DecimalWon(value: product.price)
    }
    
    func DecimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
            
            return result
        }
    
}
