//
//  BrandViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/25.
//

import UIKit

class AllMenuBrandViewController: UIViewController {

    lazy var dataManager: BrandListManager = BrandListManager()
    
    let brandMoreInfoManager = BrandMoreInfoManager.shared

    @IBOutlet weak var tableView: UITableView!
    
    var data: [BrandList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.getBrandList(self)
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    

    func didSuccess(_ response: BrandListResponse) {
        self.data = response.result
        tableView.reloadData()
    }

}


extension AllMenuBrandViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBrandCell") as? SearchBrandCell else {
            return UITableViewCell()
        }
        
        let brand = data[indexPath.item]

        cell.configure2(brand)
        
//        let url:URL! = URL(string: data[indexPath.row].imageURL)
//
//        let imageData = try! Data(contentsOf: url)
//
//        cell.thumbnailImageView.image = UIImage(data: imageData)

    
//
//        cell.brandKoNameLabel.text = brandData[indexPath.row].koreanName
//        cell.brandEnNameLabel.text = brandData[indexPath.row].englishName
//        cell.amountLabel.text = "\(brandData[indexPath.row].productNum)"
//        thumbnailImageView.image = UIImage(named: info.imageURL)
        

        
        cell.selectionStyle = .none

        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        productDetailManager.id = apiData[indexPath.row].productIdx
////        ProductDetailManager.shared.getProductDetailData2(productIdx: productDetailManager.id)
//
//
////        performSegue(withIdentifier: "ItemDetailView", sender: nil)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        brandMoreInfoManager.id = data[indexPath.row].brandIdx
        print(data[indexPath.row].brandIdx)
        performSegue(withIdentifier: "brandDetailView", sender: nil)

    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }

        return UITableView.automaticDimension
    }
    
}
