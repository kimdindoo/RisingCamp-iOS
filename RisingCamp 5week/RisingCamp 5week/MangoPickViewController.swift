//
//  NewsViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class MangoPickViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var chooseLocationButton: UIButton!
    @IBOutlet weak var myLocationButton: UIButton!
    
    let list: [EatDealData] = EatDealData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
//        visualEffectView.frame = self.blurView.frame
        self.blurView.addSubview(visualEffectView)
        
        chooseLocationButton.layer.cornerRadius = 15
        chooseLocationButton.clipsToBounds = true
        chooseLocationButton.layer.borderWidth = 1.0
        chooseLocationButton.layer.borderColor = UIColor(named: "customOrange")?.cgColor
        
        myLocationButton.layer.cornerRadius = 15
        myLocationButton.clipsToBounds = true
                  
    }
    



}


extension MangoPickViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MangoPickCell") as? MangoPickCell else {
            return UITableViewCell()
        }
        
        let eatDealData = list[indexPath.item]
        cell.configure(eatDealData)
        return cell
    }
    
  
    
}

extension MangoPickViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           if indexPath.section == 0 {
               return 300
           }
          
           return UITableView.automaticDimension
       }
}
