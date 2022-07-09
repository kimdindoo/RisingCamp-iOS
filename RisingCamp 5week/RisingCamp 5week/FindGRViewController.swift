//
//  FindGRViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class FindGRViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [RestaurangtInfo] = RestaurangtInfo.list

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    }
    


}

extension FindGRViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FindGRCell", for: indexPath) as? FindGRCell else {
            return UICollectionViewCell()
        }
        let restaurangInfo = list[indexPath.item]
        cell.configure(restaurangInfo)
        return cell
    }
    
    
}

extension FindGRViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 2열일때 계산
//        let interItemSpacing: CGFloat = 0
        let padding: CGFloat = 16

        let width = (collectionView.bounds.width - padding * 2) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)

        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
