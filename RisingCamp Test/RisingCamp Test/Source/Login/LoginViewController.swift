//
//  LoginViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/17.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    let loginBannerInfos: [LoginBannerInfo] = LoginBannerInfo.list
    
    enum Section {
        case main
    }
    
    typealias Item = LoginBannerInfo
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        
        // 애플로그인 버튼 테두리
        appleLoginButton.layer.borderWidth = 1
        appleLoginButton.layer.borderColor = UIColor.black.cgColor
        appleLoginButton.layer.cornerRadius = 25
        
        // presentation: diffable datasource
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LoginCell", for: indexPath) as? LoginCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // data: sanpshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(loginBannerInfos, toSection: .main)
        datasource.apply(snapshot)
        
        // layout: compositinal layout
        collectionView.collectionViewLayout = layout()
        collectionView.alwaysBounceVertical = false
        
        pageControl.numberOfPages = loginBannerInfos.count
    
        // 커스텀모달
        setupView()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
//        section.interGroupSpacing = 20
        
        section.visibleItemsInvalidationHandler = { (item, offset, env) in
//            print(">>> item:\(item), offset:\(offset), env:\(env)")
            
            let index = Int((offset.x / env.container.contentSize.width).rounded(.up))
            print(">>> \(index) ")
            self.pageControl.currentPage = index
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout

    }
    
    //커스텀 모달
    func setupView() {
        // cosmetics
        view.backgroundColor = .systemBackground
    }
    
    @IBAction func anotherLoginButtonTapped(_ sender: Any) {
        let vc = ModalViewController()
        vc.modalPresentationStyle = .overCurrentContext
        // keep false
        // modal animation will be handled in VC itself
        self.present(vc, animated: false)
    }
    
    
    
    
} 
