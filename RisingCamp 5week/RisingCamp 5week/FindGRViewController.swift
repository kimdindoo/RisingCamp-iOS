//
//  FindGRViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class FindGRViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
   
    

    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0

    // 데이터 배열
//    let dataArray: Array<UIImage> = [UIImage(named: "배너1.png")!, UIImage(named: "배너22.png")!, UIImage(named: "배너3.png")!, UIImage(named: "배너4.png")!, UIImage(named: "배너5.png")!]
    
    let list: [RestaurangData] = RestaurangData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        
        
        
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
        let restaurangData = list[indexPath.item]
        cell.configure(restaurangData)
        return cell
        

  

    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableView", for: indexPath)
            return headerView
            
        default:
            assert(false, "응 아니야")
        }
        
    }
    
    
}

extension FindGRViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.width - padding * 2) / 2
        let height = width * 1.35
        return CGSize(width: width, height: height)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//    
//        let width: CGFloat = collectionView.frame.width
//        let height: CGFloat = 220
//        return CGSize(width: width, height: height)
//        
//    }
    
}
