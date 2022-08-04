//
//  TabManSecondViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/18.
//

import UIKit

class TabManSecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataManager: RecommendedBrandManager = RecommendedBrandManager()
    lazy var dataManager2: FollowBrandManager = FollowBrandManager()
    
    var apiCategoryData: [CategoryInfo] = []
    var apiProductData: [ProductInfo] = []
    
    var followBrandData: [FollowBrandInfo] = []
    var followBrandResponse: FollowBrandResponse?
//    let followBrandResponse = FollowBrandResponse()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        
        dataManager.getBrandData(self)
        dataManager2.getFollowBrand(self)
    }
    
    func didSuccess(_ response: RecommendedBrandResponse) {
        self.apiCategoryData = response.result
        self.tableView.reloadData()
    }
  
    
    func didSuccessFollowBrand(_ response: FollowBrandResponse){
        self.followBrandData = response.result
        self.followBrandResponse = response

        self.tableView.reloadData()
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    

}

extension TabManSecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        switch section {
//        case 0,1,2,3,4,5,6,7:
//            return 1
//        case 8:
//            return 2
//        default:
//            return 0
//        }
        
        return 1
  

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
            
            switch indexPath.section {
            case 0:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell2") as? HomeBrandCell2 {

                    
                    print(" cell 1 section : \(indexPath.section)")
                    print(" cell 1 row : \(indexPath.row)")
                    
                    let data = followBrandResponse?.result[0]
                    cell.brandEnNameLabel.text = data?.englishName
                    cell.brandNameLabel.text = data?.koreanName
                    cell.productNumLabel.text = "\(data?.productNum ?? 0)"
                    
                    let url = URL(string: "https://i.pinimg.com/originals/6d/54/e2/6d54e2f42fc181b134197c18efbd3f7d.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.brandImageView.image = UIImage(data: imageData)
                    
                    // 오류
    //                let url = URL(string: data?.imageURL)
    //                let imageData = try? Data(contentsOf: url)
    //                let loadedImage = UIImage(data: imageData)
    //                cell.brandImageView.image = loadedImage



                return cell
            }
            case 2:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell2") as? HomeBrandCell2 {

                    
                    print(" cell 1 section : \(indexPath.section)")
                    print(" cell 1 row : \(indexPath.row)")
                    
                    let data = followBrandResponse?.result[1]
                    cell.brandEnNameLabel.text = data?.englishName
                    cell.brandNameLabel.text = data?.koreanName
                    cell.productNumLabel.text = "\(data?.productNum ?? 0)"
                    
                    let url = URL(string: "https://menu.mt.co.kr/moneyweek/thumb/2020/10/26/06/2020102608338033041_1.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.brandImageView.image = UIImage(data: imageData)


                return cell
            }
            case 4:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell2") as? HomeBrandCell2 {

                    
                    print(" cell 1 section : \(indexPath.section)")
                    print(" cell 1 row : \(indexPath.row)")
                    
                    let data = followBrandResponse?.result[2]
                    cell.brandEnNameLabel.text = data?.englishName
                    cell.brandNameLabel.text = data?.koreanName
                    cell.productNumLabel.text = "\(data?.productNum ?? 0)"
                    
                    
                    let url = URL(string: "https://i.pinimg.com/originals/65/05/ba/6505ba2a9ff3e649326feaf2ddf7a161.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.brandImageView.image = UIImage(data: imageData)


                return cell
            }
                
            case 7:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell2") as? HomeBrandCell2 {

                    
                    print(" cell 1 section : \(indexPath.section)")
                    print(" cell 1 row : \(indexPath.row)")
                    
                    let data = followBrandResponse?.result[3]
                    cell.brandEnNameLabel.text = data?.englishName
                    cell.brandNameLabel.text = data?.koreanName
                    cell.productNumLabel.text = "\(data?.productNum ?? 0)"
                    
                    let url = URL(string: "https://blog.kakaocdn.net/dn/rKDaW/btqWQ8nWHt6/bncOmTPZzzMxTJK8K9xngK/img.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.brandImageView.image = UIImage(data: imageData)
                    


                return cell
            }
                
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell") as? HomeBrandCell {
                    
                    let data = followBrandResponse?.result[0].products[0]
                    cell.elapedTimeLabel.text = data?.elapsedTime
                    cell.productNameLabel.text = data?.name
                    cell.regionLabel.text = data?.region
                    cell.priceLabel.text = "\(convertToCurrencyFormat(price:(data?.price ?? 0)))"
                    
                    let url = URL(string: "https://media.bunjang.co.kr/product/192989336_2_1657786344_w856.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.productImageView.image = UIImage(data: imageData)
                    
                    return cell
                }
                
            case 3:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell") as? HomeBrandCell {
                    
                    let data = followBrandResponse?.result[1].products[0]
                    cell.elapedTimeLabel.text = data?.elapsedTime
                    cell.productNameLabel.text = data?.name
                    cell.regionLabel.text = data?.region
                    cell.priceLabel.text = "\(convertToCurrencyFormat(price:(data?.price ?? 0)))"

                    let url = URL(string: "https://media.bunjang.co.kr/product/194261585_1_1658542636_w292.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.productImageView.image = UIImage(data: imageData)
                    
                    return cell
                }
                
            case 5:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell") as? HomeBrandCell {
                    
                    let data = followBrandResponse?.result[2].products[0]
                    cell.elapedTimeLabel.text = data?.elapsedTime
                    cell.productNameLabel.text = data?.name
                    cell.regionLabel.text = data?.region
                    cell.priceLabel.text = "\(convertToCurrencyFormat(price:(data?.price ?? 0)))"

                    let url = URL(string: "https://media.bunjang.co.kr/product/179993359_1_1646029166_w292.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.productImageView.image = UIImage(data: imageData)
                    
                    return cell
                }
                
            case 6:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell") as? HomeBrandCell {
                    
                    let data = followBrandResponse?.result[2].products[1]
                    cell.elapedTimeLabel.text = data?.elapsedTime
                    cell.productNameLabel.text = data?.name
                    cell.regionLabel.text = data?.region
                    cell.priceLabel.text = "\(convertToCurrencyFormat(price:(data?.price ?? 0)))"

                    let url = URL(string: "https://media.bunjang.co.kr/product/190424044_1_1654954017_w292.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.productImageView.image = UIImage(data: imageData)
                    
                    return cell
                }
            case 8:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell") as? HomeBrandCell {
                    
                    let data = followBrandResponse?.result[3].products[0]
                    cell.elapedTimeLabel.text = data?.elapsedTime
                    cell.productNameLabel.text = data?.name
                    cell.regionLabel.text = data?.region
                    cell.priceLabel.text = "\(convertToCurrencyFormat(price:(data?.price ?? 0)))"
                    
                    
                    let url = URL(string: "https://media.bunjang.co.kr/product/193941474_1_1658241135_w292.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.productImageView.image = UIImage(data: imageData)
                    
                    return cell
                }
                
            case 9:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeBrandCell") as? HomeBrandCell {
                    
                    let data = followBrandResponse?.result[3].products[1]
                    cell.elapedTimeLabel.text = data?.elapsedTime
                    cell.productNameLabel.text = data?.name
                    cell.regionLabel.text = data?.region
                    cell.priceLabel.text = "\(convertToCurrencyFormat(price:(data?.price ?? 0)))"
                    
                    let url = URL(string: "https://media.bunjang.co.kr/product/161402364_2_1628590391_w856.jpg")
                    let imageData = try! Data(contentsOf: url!)
                    cell.productImageView.image = UIImage(data: imageData)
                    
                    return cell
                }
                
     
        
            default:
                return UITableViewCell()
            }
            

    
        return UITableViewCell()
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0,2,4,7:
            return 100
        case 1,3,5,6,8:
            return 180
        default:
            return 180
        }
    
    }


}


