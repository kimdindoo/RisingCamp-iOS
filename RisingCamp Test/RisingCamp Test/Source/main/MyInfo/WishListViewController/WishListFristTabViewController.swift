//
//  WishListFristTabViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import UIKit

class WishListFristTabViewController: UIViewController {

    lazy var dataManager: WishListManager = WishListManager()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data: [ProductList] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        dataManager.getWishList(self)
        
    }
    
    func didSuccess(_ response: WishListResponse) {

        self.data = response.result.productList
        collectionView.reloadData()

        
    }
    
}


extension WishListFristTabViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WishListCell", for: indexPath) as? WishListCell else {
            return UICollectionViewCell()
        }
  
//        cell.nameLabel.text = apiData[indexPath.row].name
//        cell.priceLabel.text = "\(apiData[indexPath.row].price)"
//        cell.locationLabel.text = apiData[indexPath.row].region
//        cell.elapsedTimeLabel.text = apiData[indexPath.row].elapsedTime
//
//
        let row = self.data[indexPath.row]

        let url:URL! = URL(string: row.productImageURL)

        let imageData = try! Data(contentsOf: url)

        cell.productImageView.image = UIImage(data: imageData)
        
        cell.productNameLabel.text = row.productName
        
        cell.priceLabel.text = "\(row.price)"
        
        
        return cell
        

    }
    

    

    
}

extension WishListFristTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - padding * 2) / 2
        let height = width * 1.4
        return CGSize(width: width, height: height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    
}
