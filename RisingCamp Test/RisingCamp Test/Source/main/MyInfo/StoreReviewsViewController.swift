//
//  StoreReviewsViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import UIKit

class StoreReviewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataManager: StoreReviewsManager = StoreReviewsManager()
    
    var data: [reviewInfo] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dataManager.getStoreReviews(self)
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""

    }
    

    func didSuccess(_ response: StoreReviewsResponse) {
        self.data = response.result
        tableView.reloadData()
    }

}


extension StoreReviewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoreReviewsCell") as? StoreReviewsCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
                
        let row = self.data[indexPath.row]

        cell.productNameLabel.text = row.name
        cell.storeNameLabel.text = row.storeName
        cell.reviewLabel.text = row.reviewText
        cell.createdAtLabel.text = row.createdAt
        
//        let url:URL! = URL(string: row.imageURL)
//
//        let imageData = try! Data(contentsOf: url)
//
//        cell.thumnailImageView.image = UIImage(data: imageData)
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 210
        }

        return UITableView.automaticDimension
    }
    
    
    
}
