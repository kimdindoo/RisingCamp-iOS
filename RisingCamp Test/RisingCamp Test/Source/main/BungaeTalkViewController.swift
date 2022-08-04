//
//  BungaeTalkViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/16.
//

import UIKit

class BungaeTalkViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bungaeTalkList: [BungaeTalkModel] = BungaeTalkModel.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // 날짜 내림차순
//        bungaeTalkList = bungaeTalkList.sorted(by: { BungaeTalkModel1, BungaeTalkModel2 in
//            return BungaeTalkModel1.date > BungaeTalkModel2.date
//        })
        
    }
    
}

extension BungaeTalkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bungaeTalkList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BungaeTalkCell", for: indexPath) as? BungaeTalkCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.profileImageView.image = UIImage(named: bungaeTalkList[indexPath.row].profileImage)
        cell.chatLabel.text = bungaeTalkList[indexPath.row].chat
        cell.storeNameLabel.text = bungaeTalkList[indexPath.row].name
        cell.dateLabel.text = bungaeTalkList[indexPath.row].date
        
        return cell
    }
}



extension BungaeTalkViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100

    }
    
}
