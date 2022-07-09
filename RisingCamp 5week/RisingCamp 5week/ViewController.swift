//
//  ViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restaurantNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapPatchRestaurantButton(_ sender: Any) {
        
        RestaruangRequest().getRestaruantData(self)
    }
    func didSuccess(_ response: RestaurangResponse) {
        
        self.restaurantNameLabel.text = response.body?[0].mnmnu ?? ""
    }

}


