//
//  ShoppingCartViewController.swift
//  Starbucks Clone
//
//  Created by 김진수 on 2022/06/21.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    @IBOutlet weak var coffeName: UILabel!
    @IBOutlet weak var cupSize: UILabel!
    
    var result1: String? = "DEFAULT"
    var result2: String? = "DEFAULT"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        coffeName.text = result1
        cupSize.text = result2
    }

}
