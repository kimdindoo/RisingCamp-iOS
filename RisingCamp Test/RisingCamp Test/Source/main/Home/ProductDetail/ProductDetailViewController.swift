//
//  ProductDetailViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/26.
//

import UIKit


class ProductDetailViewController: UIViewController {
    
//    lazy var dataManager: ProductDetailManager = ProductDetailManager()
    
    let productDetailManager = ProductDetailManager.shared
    
    
    var detailDate: String?
    
    var data: ProductDetailInfo?
    var relatedProductData: [RelatedProductInfo] = []
    
    var PSList: [PowerShoppingModel] = PowerShoppingModel.list

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var elaspedTimeLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    
    @IBOutlet weak var viewNumLabel: UILabel!
    @IBOutlet weak var messeageNumLabel: UILabel!
    @IBOutlet weak var heartNumLabel: UILabel!
    
    
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        
        // 네비게이션 바 배경색 같게 하기
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // 네비게이션 바 뷰랑 구분선 없애기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
//        dataManager.getProductDetailData(self)

        productDetailManager.getProductDetailData2(self, productIdx: productDetailManager.id)
        
        // 연관상품 가져오기
        RelatedProductManager.shared.getProductDetailData2(self, productIdx: 41)
        
        print(productDetailManager.id)
        
        collectionView1.dataSource = self
        collectionView1.delegate = self
        
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
        collectionView3.dataSource = self
        collectionView3.delegate = self
        
        if let flowlayout = collectionView1.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        
        if let flowlayout = collectionView2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        if let flowlayout = collectionView3.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        viewNumLabel.text = "\(Int.random(in: 0...10000))"
        messeageNumLabel.text = "\(Int.random(in: 0...20))"
        heartNumLabel.text = "\(Int.random(in: 0...100))"
        
        
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") else {
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }

    func didSuccess(_ response: ProductDetailResponse) {

        self.data = response.result
        collectionView1.reloadData()
        
//        print("=========================================")
//        print(data?.storeInfo.storeName)
        
        let url = URL(string: response.result.images[0])
        let data = try! Data(contentsOf: url!)
        thumbnailImageView.image = UIImage(data: data)
        
        
        
        productPriceLabel.text = "\(convertToCurrencyFormat(price:(response.result.price)))"
        productNameLabel.text = response.result.name
        descriptionLabel.text = response.result.description
        elaspedTimeLabel.text = response.result.elapsedTime
        regionLabel.text = response.result.region
        tagLabel.text = response.result.tags[0]
        
//        storeNameLabel.text =  response.result.storeInfo.storeName
//        ratingLabel.text = "\(response.result.storeInfo.ratings)"
//        followerNumLabel.text = "\(response.result.storeInfo.ratings)"
//        productNumLabel.text = "\(response.result.storeInfo.productNum)"
    }
    
    func didSuccessRelatedProduct(_ response: RelatedProductResponse) {
        
        self.relatedProductData = response.result
        collectionView2.reloadData()
        
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    

    @IBAction func DeclarationButtonTapped(_ sender: Any) {
        DeclarationManager.shared.productIdx =  data?.productIdx ?? 0
        print(data?.productIdx ?? 0)
    }
    
}

extension ProductDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        if collectionView == collectionView1 {
            return data?.storeInfo.products.count ?? 0
        } else if collectionView == collectionView2 {
            return relatedProductData.count
        } else if collectionView == collectionView3 {
            return PSList.count
        }
            return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCell", for: indexPath) as? ProductDetailCell else {
//            return UICollectionViewCell()
//        }
//
//        return cell
        
        if collectionView == collectionView1 {
            guard let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCell", for: indexPath) as? ProductDetailCell else { return UICollectionViewCell() }
            
//            cell1.productNameLabel.text = data?.storeInfo.products[indexPath.row]
            
            return cell1
            
        } else if collectionView == collectionView2 {
            guard let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCell2", for: indexPath) as? ProductDetailCell2 else { return UICollectionViewCell() }
            
            cell2.priceLabel.text = "\(convertToCurrencyFormat(price: relatedProductData[indexPath.row].price))"
            cell2.nameLabel.text = relatedProductData[indexPath.row].name
            
            

            let url:URL! = URL(string: relatedProductData[indexPath.row].imageUrl)

            let imageData = try! Data(contentsOf: url)

            cell2.productImageView.image = UIImage(data: imageData)
            
            
            return cell2
            
        } else if collectionView == collectionView3 {
            guard let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCell3", for: indexPath) as? ProductDetailCell3 else { return UICollectionViewCell() }
            
            cell3.productImageView.image = UIImage(named:PSList[indexPath.row].productImage)
            cell3.nameLabel.text = PSList[indexPath.row].name
            cell3.priceLabel.text = "\(convertToCurrencyFormat(price: PSList[indexPath.row].price))"
            return cell3
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let  headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProductDetailHeaderReusableView", for: indexPath) as? ProductDetailHeaderReusableView else { return UICollectionReusableView() }
            
            
            headerView.storeNameLabel.text = data?.storeInfo.storeName
            headerView.ratingLabel.text = "\(data?.storeInfo.ratings ?? 0)"
            headerView.followerNumLabel.text = "\(data?.storeInfo.ratings ?? 0)"
            headerView.productNumLabel.text = "\(data?.storeInfo.productNum ?? 0)"
            
            return headerView
        default:
            assert(false, "응 아니야")
        }

    }
    

    
    
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        let padding: CGFloat = 16
//
//        let width = (collectionView.bounds.width - padding * 2) / 2
//        let height = width * 2
//        return CGSize(width: width, height: height)
        
    
        
        
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16

        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2 - 36) / 3
        let height = width * 2
        
        return CGSize(width: width, height: height)

        
//        if collectionView == collectionView1 {
//            return CGSize(width: width, height: height)
//        }
//            
//        else if collectionView == collectionView2 {
//            return CGSize(width: width, height: height)
//
//        } else {
//            return CGSize(width: width, height: height)
//
//        }
            
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
        
    }

    
}
