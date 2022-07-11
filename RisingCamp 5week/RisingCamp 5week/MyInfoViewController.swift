//
//  MyInfoViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class MyInfoViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginButton.layer.cornerRadius = 20
        self.loginButton.clipsToBounds = true
    }
    

  

}
