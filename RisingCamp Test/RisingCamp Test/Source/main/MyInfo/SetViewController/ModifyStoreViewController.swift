//
//  ModifyStoreViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import UIKit

class ModifyStoreViewController: UIViewController {

    lazy var dataManager: ModifyStoreManager = ModifyStoreManager()
    var modifyDataManager = ModifyStoreManager.shared
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var storeNameTextView: UITextView!
    @IBOutlet weak var shopUrlTextView: UITextView!
    @IBOutlet weak var contactTimeTextView: UITextView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var policyTextView: UITextView!
    @IBOutlet weak var precautionsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.getModifyStore(self)
        
        thumbnailImageView.layer.cornerRadius = thumbnailImageView.frame.width / 2
        thumbnailImageView.clipsToBounds = true

    }
    
    func didSuccess(_ response: ModifyStoreResponse) {
        storeNameTextView.text = response.result.storeName
        shopUrlTextView.text = response.result.shopUrl
        contactTimeTextView.text = response.result.contactTime
        descriptionTextView.text = response.result.description
        policyTextView.text = response.result.policy
        precautionsTextView.text = response.result.precautions
    }

    @IBAction func backButtonTapped(_ sender: Any) {
        
        //뷰컨트롤러 닫기
        dismiss(animated: true, completion: nil)
          
    }
    
    @IBAction func confrimButtonTapped(_ sender: Any) {
        modifyDataManager.storeName = storeNameTextView.text
        modifyDataManager.shopUrl = shopUrlTextView.text
        modifyDataManager.contactTime = contactTimeTextView.text
        modifyDataManager.description = descriptionTextView.text
        modifyDataManager.policy = policyTextView.text
        modifyDataManager.precautions = precautionsTextView.text
        
        
        print(modifyDataManager.storeName)
        
        modifyDataManager.patchModifyStore()
        
        dismiss(animated: true, completion: nil)

    }
}
