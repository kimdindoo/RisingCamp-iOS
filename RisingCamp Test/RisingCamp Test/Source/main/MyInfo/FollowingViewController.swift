//
//  FollowingViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import UIKit

class FollowingViewController: UIViewController {

    lazy var dataManager: FollowingManager = FollowingManager()
    
    @IBOutlet weak var storeName1Label: UILabel!
    @IBOutlet weak var productNum1Label: UILabel!
    @IBOutlet weak var followerNum1Label: UILabel!
    @IBOutlet weak var price1Label: UILabel!
    @IBOutlet weak var price1Label2: UILabel!
    @IBOutlet weak var price1Label3: UILabel!


    
    @IBOutlet weak var productImageView1: UIImageView!
    @IBOutlet weak var productImageView2: UIImageView!
    @IBOutlet weak var productImageView3: UIImageView!
    @IBOutlet weak var productImageView4: UIImageView!
    @IBOutlet weak var productImageView5: UIImageView!
    @IBOutlet weak var productImageView6: UIImageView!

    
    
    @IBOutlet weak var storeName2Label: UILabel!
    @IBOutlet weak var productNum2Label: UILabel!
    @IBOutlet weak var followerNum2Label: UILabel!
    @IBOutlet weak var price2Label: UILabel!
    
    
    
    var data: [FollowingInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.getStorefollowing(self)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    

    func didSuccess( _ response: FollowingResponse) {
        self.data = response.result
        
        storeName1Label.text = data[0].storeName
        productNum1Label.text = "\(data[0].productsNum)"
        followerNum1Label.text = "\(data[0].followerNum)"
        price1Label.text = "\(convertToCurrencyFormat(price:data[0].getFavoriteUserProductsDetailResList[0].price))"
        price1Label2.text = "\(convertToCurrencyFormat(price:data[0].getFavoriteUserProductsDetailResList[1].price))"
        price1Label3.text = "\(convertToCurrencyFormat(price:data[0].getFavoriteUserProductsDetailResList[2].price))"
        
        storeName2Label.text = data[1].storeName
        productNum2Label.text = "\(data[1].productsNum)"
        followerNum2Label.text = "\(data[1].followerNum)"
        price2Label.text = "\(convertToCurrencyFormat(price:data[1].getFavoriteUserProductsDetailResList[0].price))"


//        let row = data[0].getFavoriteUserProductsDetailResList[0]
        let url1:URL! = URL(string: data[0].getFavoriteUserProductsDetailResList[0].imageURL)
        let imageData1 = try! Data(contentsOf: url1)
        productImageView1.image = UIImage(data: imageData1)
        
        let url2:URL! = URL(string: data[0].getFavoriteUserProductsDetailResList[1].imageURL)
        let imageData2 = try! Data(contentsOf: url2)
        productImageView2.image = UIImage(data: imageData2)
        
        
        let url3:URL! = URL(string: data[0].getFavoriteUserProductsDetailResList[2].imageURL)
        let imageData3 = try! Data(contentsOf: url3)
        productImageView3.image = UIImage(data: imageData3)
        
        
        let url4:URL! = URL(string: data[1].getFavoriteUserProductsDetailResList[0].imageURL)
        let imageData4 = try! Data(contentsOf: url4)
        productImageView4.image = UIImage(data: imageData4)
        
//        let url5:URL! = URL(string: data[1].getFavoriteUserProductsDetailResList[1].imageURL)
//        let imageData5 = try! Data(contentsOf: url5)
//        productImageView5.image = UIImage(data: imageData5)
//
//        let url6:URL! = URL(string: data[1].getFavoriteUserProductsDetailResList[2].imageURL)
//        let imageData6 = try! Data(contentsOf: url6)
//        productImageView6.image = UIImage(data: imageData6)
//

    }
    

}
