//
//  MyInfoViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/16.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    lazy var dataManager: MypageManager = MypageManager()
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var inquiryButton: UIButton!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var wishListLabel: UILabel!
    
    var data: MyPageInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 2
        thumbnailImageView.clipsToBounds = true

        
        let followerTap = UITapGestureRecognizer(target: self, action: #selector(MyInfoViewController.followerTapFunction))
        followerLabel.isUserInteractionEnabled = true
        followerLabel.addGestureRecognizer(followerTap)
        
        let reviewTap = UITapGestureRecognizer(target: self, action: #selector(MyInfoViewController.reviewTapFunction))
        reviewLabel.isUserInteractionEnabled = true
        reviewLabel.addGestureRecognizer(reviewTap)
        
        let followingTap = UITapGestureRecognizer(target: self, action: #selector(MyInfoViewController.followingTapFunction))
        followingLabel.isUserInteractionEnabled = true
        followingLabel.addGestureRecognizer(followingTap)
        
        let wishListTap = UITapGestureRecognizer(target: self, action: #selector(MyInfoViewController.wishListTapFunction))
        wishListLabel.isUserInteractionEnabled = true
        wishListLabel.addGestureRecognizer(wishListTap)
        
        inquiryButton.layer.borderWidth = 1
        inquiryButton.layer.borderColor = UIColor.lightGray.cgColor
        inquiryButton.layer.cornerRadius = 10
        
        dataManager.getMyPageInfo(self)
        
    }
    
    func didSuccess(_ response: MyPageResponse) {
        self.data = response.result
        
        reviewLabel.text = "\(data?.reviewNum ?? 0)"
        followerLabel.text = "\(data?.followerNum ?? 0)"
        followingLabel.text = "\(data?.followingNum ?? 0)"
        wishListLabel.text = "\(data?.likeNum ?? 0)"
        storeNameLabel.text = data?.name ?? ""

    
    }
    
    @IBAction func followerTapFunction(sender: UITapGestureRecognizer) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "FollowerViewController") {
          // 여기서 navigationController 이게 맨 앞에 있는 navigation임
          self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func reviewTapFunction(sender: UITapGestureRecognizer) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "StoreReviewsViewController") {
          // 여기서 navigationController 이게 맨 앞에 있는 navigation임
          self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func followingTapFunction(sender: UITapGestureRecognizer) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "FollowingViewController") {
          // 여기서 navigationController 이게 맨 앞에 있는 navigation임
          self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func wishListTapFunction(sender: UITapGestureRecognizer) {
        if let controller = self.storyboard?.instantiateViewController(identifier: "WishListViewController") {
          // 여기서 navigationController 이게 맨 앞에 있는 navigation임
          self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
    
}
