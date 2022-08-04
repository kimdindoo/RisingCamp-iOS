//
//  SoldOutViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/20.
//

import UIKit

class SoldOutViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataManager: MyPageProductsManager = MyPageProductsManager()
    
    var data: [MyPageProducts] = []

    @IBOutlet weak var countNumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        self.tableView?.rowHeight = UITableView.automaticDimension
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        
        dataManager.getSoldOutPrduct(self)
    }
    
    func didSuccess(_ response: MyPageProductsResponse) {
        self.data = response.result
        tableView.reloadData()
        
        countNumLabel.text = "\(response.result.count)"

    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        let result = numberFormatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
}

extension SoldOutViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            guard let topCell = tableView.dequeueReusableCell(withIdentifier: "MySoldOutCell", for: indexPath) as? MySoldOutCell else { return UITableViewCell() }
            
            topCell.selectionStyle = .none
            
            let row = self.data[indexPath.row]

            topCell.productNameLabel.text = row.name
            topCell.priceLabel.text = "\(convertToCurrencyFormat(price: (row.price)))"
            
            let url:URL! = URL(string: row.imageURL)

            let imageData = try! Data(contentsOf: url)

            topCell.thumbnailImageView.image = UIImage(data: imageData)
            
            return topCell
        }
       
        else {
            guard let bottomCell = tableView.dequeueReusableCell(withIdentifier: "MyInfoBannerCell", for: indexPath) as? MyInfoBannerCell else {  return UITableViewCell() }
            bottomCell.accessoryType = .none

            bottomCell.selectionStyle = .none
            return bottomCell
        }
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return data.count
        }
        
        else {
            return 1
        }
        
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
        
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        } else if indexPath.section == 1 {
            return 400
        }

        return UITableView.automaticDimension
    }
        
    
}
