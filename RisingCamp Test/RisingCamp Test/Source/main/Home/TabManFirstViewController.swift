//
//  TapManFirstViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/18.
//

import UIKit

class TabManFirstViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    // Datamanager
    lazy var dataManager: RecommendedProductManager = RecommendedProductManager()
    
    let productDetailManager = ProductDetailManager.shared

    
    var apiData: [Product] = []
    var productDetailData: [ProductDetailResponse] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        dataManager.getProductData(self)
        
    }
    
    func didSuccess(_ response: RecommendedProductResponse) {
        self.apiData = response.result
        self.collectionView.reloadData()
        
//        print(apiData.count)
        

        
    }
    
    func didSuccessPrdouctDetail(_ response: ProductDetailResponse) {
        
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
    
    

}


extension TabManFirstViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
        return apiData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendProductCell", for: indexPath) as? recommendProductCell else {
            return UICollectionViewCell()
        }
  
        cell.nameLabel.text = apiData[indexPath.row].name
        cell.priceLabel.text = "\(convertToCurrencyFormat(price:(apiData[indexPath.row].price)))"
        cell.locationLabel.text = apiData[indexPath.row].region
        cell.elapsedTimeLabel.text = apiData[indexPath.row].elapsedTime
        
        
        
        let row = self.apiData[indexPath.row]

        let url:URL! = URL(string: row.imageUrl)

        let imageData = try! Data(contentsOf: url)

        cell.thumbnailImageView.image = UIImage(data: imageData)
        
        
        return cell
        

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productDetailManager.id = apiData[indexPath.row].productIdx
//        ProductDetailManager.shared.getProductDetailData2(productIdx: productDetailManager.id)
        
  
        performSegue(withIdentifier: "ItemDetailView", sender: nil)
        
  
        
    }



    
}

extension TabManFirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - padding * 2) / 2
        let height = width * 2
        return CGSize(width: width, height: height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
}
