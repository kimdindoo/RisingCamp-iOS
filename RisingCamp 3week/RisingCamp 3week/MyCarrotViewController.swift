//
//  MyCarrotViewController.swift
//  RisingCamp 3week
//
//  Created by 김진수 on 2022/06/26.
//

import UIKit

class MyCarrotViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView?.register(UINib(nibName: "MyCarrotCell1", bundle: nil), forCellReuseIdentifier: "section1")
//        self.tableView?.register(UINib(nibName: "MyCarrotCell2", bundle: nil), forCellReuseIdentifier: "section2")
        
        // Do any additional setup after loading the view.
        
        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    


}
extension MyCarrotViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            guard let topCell = tableView.dequeueReusableCell(withIdentifier: "table1", for: indexPath) as? Table1Cell else { return UITableViewCell() }
            
            topCell.imageView1.layer.cornerRadius = 35
            topCell.imageView1.layer.masksToBounds = true
            
            topCell.imageView2.layer.cornerRadius = 35
            topCell.imageView2.layer.masksToBounds = true
            
            topCell.imageView3.layer.cornerRadius = 35
            topCell.imageView3.layer.masksToBounds = true
            
            topCell.selectionStyle = .none
            return topCell
        }
        else if indexPath.section == 1 {
            guard let middleCell = tableView.dequeueReusableCell(withIdentifier: "table2", for: indexPath) as? Table2Cell else { return UITableViewCell() }
            middleCell.selectionStyle = .none

            return middleCell
        }
        else if indexPath.section == 2 {
            guard let bottomCell = tableView.dequeueReusableCell(withIdentifier: "table3", for: indexPath) as? Table3Cell else {  return UITableViewCell() }
            bottomCell.accessoryType = .none

            return bottomCell
        }
        else if indexPath.section == 3 {
            guard let bottomCell2 = tableView.dequeueReusableCell(withIdentifier: "table4", for: indexPath) as? Table4Cell else {  return UITableViewCell() }
            bottomCell2.accessoryType = .none

            return bottomCell2

            
        } else {
            guard let bottomCell3 = tableView.dequeueReusableCell(withIdentifier: "table5", for: indexPath) as? Table5Cell else {  return UITableViewCell() }
            bottomCell3.accessoryType = .none

            return bottomCell3
        }
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "table1") as? Table1Cell else {
//            return UITableViewCell()
//        }
//        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
        
        
        // xib 이용
//        // TableView item 개수
//            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//                return 6
//            }
//
//            // TableView Cell의 Object
//            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//                let cell = tableView.dequeueReusableCell(withIdentifier: "section1", for: indexPath) as! MyCarrotCell1
////
////                if (indexPath.item % 2 == 0) {
////                    let cell = tableView.dequeueReusableCell(withIdentifier: "section1", for: indexPath) as! MyCarrotCell1
////                    return cell
////                } else {
////                    let cell = tableView.dequeueReusableCell(withIdentifier: "section2", for: indexPath) as! MyCarrotCell2
////                    return cell
////                }
//                cell.selectionStyle = .none
//                return cell
//
//            }
//
//        func numberOfSections(in tableView: UITableView) -> Int {
//            return 3
//        }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 {
            return 150
        } else if indexPath.section == 4 {
            return 250
        }

        return UITableView.automaticDimension
    }
        
    
}
