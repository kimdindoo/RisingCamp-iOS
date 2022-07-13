//
//  ViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var mainMenuLabel: UILabel!
    
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var testImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    @IBAction func tapPatchRestaurantButton(_ sender: Any) {
    
        RestaruangRequest().getRestaruantData(self)
    }
    func didSuccess(_ response: RestaurangResponse) {
        
        self.restaurantNameLabel.text = response.body?[0].cmpnm ?? ""
        self.mainMenuLabel.text = response.body?[0].mnmnu ?? ""
        self.menuLabel.text = response.body?[0].menu ?? ""
        self.urlLabel.text = response.body?[0].url ?? ""
        self.telLabel.text = response.body?[0].telno ?? ""
        self.locationLabel.text = response.body?[0].adres ?? ""
        self.timeLabel.text = response.body?[0].time ?? ""
        self.introduceLabel.text = response.body?[0].dc ?? ""
    }

}
