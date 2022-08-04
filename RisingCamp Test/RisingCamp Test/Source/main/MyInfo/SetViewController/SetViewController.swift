//
//  SetViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import UIKit

class SetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var setMenu = [
        SetMenuInfo(setMenuName: "계정 설정"),
        SetMenuInfo(setMenuName: "알림 설정"),
        SetMenuInfo(setMenuName: "우리동네 지역 설정"),
        SetMenuInfo(setMenuName: "배송지 설정"),
        SetMenuInfo(setMenuName: "계좌 설정"),
        SetMenuInfo(setMenuName: "간편결제 카드설정"),
        SetMenuInfo(setMenuName: "차단 상점 관리"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }



}


extension SetViewController: UITableViewDelegate, UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
        return setMenu.count
    }
    return 0
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    
    
    if indexPath.section == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SetCell", for: indexPath) as? SetCell else { return UITableViewCell() }
        
        cell.setMenuNameLabel.text = setMenu[indexPath.row].setMenuName
        
        return cell
    }
   
    else {
 
        return UITableViewCell()
    }
    
    
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
        return 50
    }

    return UITableView.automaticDimension
}



}
