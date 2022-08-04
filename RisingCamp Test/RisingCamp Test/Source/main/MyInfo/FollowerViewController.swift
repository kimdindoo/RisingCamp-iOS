//
//  FollowerViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import UIKit

class FollowerViewController: UIViewController {

    lazy var dataManager: FollowerManager = FollowerManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    var data: [followerInfo] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dataManager.getStorefollowers(self)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""

    }
    
    func didSuccess(_ response: FollowerResponse) {
        self.data = response.result ?? []
        self.tableView.reloadData()
    }
    


}


extension FollowerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell") as? FollowerCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.storeNameLabel.text = data[indexPath.row].storeName
        cell.followerNumLabel.text = "\(data[indexPath.row].followingNum ?? 1)"
        cell.productNumLabel.text = "\(data[indexPath.row].productNum ?? 1)"
    

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }

        return UITableView.automaticDimension
    }
    
    
    
}
