//
//  BrandMoreInfoViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import UIKit

class BrandMoreInfoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var brandImageView: UIImageView!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandEnNameLabel: UILabel!
    
    // Datamanager
//    lazy var dataManager: BrandMoreInfoManager = BrandMoreInfoManager()
//
    let brandMoreInfoManager = BrandMoreInfoManager.shared
    
    var data: [BrandMoreInfo] = []
    var data2: [GetProductInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        brandMoreInfoManager.getBrandMoreInfo(self, brandId: brandMoreInfoManager.id)
        
        
    }
    
    func didSuccess(_ response: BrandMoreInfoResponse) {
        
        brandNameLabel.text = response.result[0].name
        brandEnNameLabel.text = response.result[0].englishName
        
//        let url:URL! = URL(string: response.result[0].imageURL)
//
//        let imageData = try! Data(contentsOf: url)
//
//        brandImageView.image = UIImage(data: imageData)
        
        self.data = response.result
        self.data2 = response.result[0].getProductInfo
        
        collectionView.reloadData()
     
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }

  

}


extension BrandMoreInfoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandMoreInfoCell", for: indexPath) as? BrandMoreInfoCell else {
            return UICollectionViewCell()
        }

//        cell.nameLabel.text = data[indexPath.row].name
//        cell.priceLabel.text = "\(data[indexPath.row].price)"
//        cell.locationLabel.text = data[indexPath.row].region
//        cell.elapsedTimeLabel.text = data[indexPath.row].elapsedTime
//
//
        let row = self.data2[indexPath.row]

        let url:URL! = URL(string: row.imageURL)

        let imageData = try! Data(contentsOf: url)

        cell.productImageView.image = UIImage(data: imageData)
        
        cell.productNameLabel.text = row.name
        
        cell.priceLabel.text = "\(row.price)"
        
        
        
        return cell
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        productDetailManager.id = apiData[indexPath.row].productIdx
//        ProductDetailManager.shared.getProductDetailData2(productIdx: productDetailManager.id)
        
  
//        performSegue(withIdentifier: "ItemDetailView", sender: nil)
    }


    
}

extension BrandMoreInfoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let padding: CGFloat = 16
//
//        let width = (collectionView.bounds.width - padding * 2) / 2
//        let height = width * 2
//        return CGSize(width: width, height: height)
        
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16

        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2) / 3
        let height = width * 1.8
        return CGSize(width: width, height: height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
}
