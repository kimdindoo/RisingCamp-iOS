//
//  StoreNameViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/23.
//

import UIKit

class StoreNameViewController: UIViewController {

    @IBOutlet weak var storeNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func confirmButtonTapped(_ sender: Any) {
        print(self.storeNameTextField.text!)

        selfAuthManager.shared.postStoreName(storeName: self.storeNameTextField.text!, vc: self)
    }
    
 
    

}
