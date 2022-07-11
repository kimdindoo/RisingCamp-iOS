//
//  NewsViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class MangoPickViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let list: [EatDealData] = EatDealData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        
        
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
