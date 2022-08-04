//
//  DeclarationViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import UIKit

class DeclarationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableViewItems = ["광고 (상점 및 타사이트 홍보, 상품도배)","상품 정보 부정확 (상품명, 이미지, 가격, 태그 등)","거래 금지 품목","안전결제 허위매물(안전결제 표시 상품 안전결제 거부)","사기의심(외부채널 유도", "기타(사유)"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    
}



extension DeclarationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewItems.count
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DeclarationCell", for: indexPath) as? DeclarationCell else { return UITableViewCell() }
        cell.selectTypeLabel.text = tableViewItems[indexPath.row]
        return cell
      
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //클릭한 셀의 이벤트 처리
           tableView.deselectRow(at: indexPath, animated: true)
           
           print("Click Cell Number: " + String(indexPath.row))
        
        DeclarationManager.shared.reportType = indexPath.row
           
        performSegue(withIdentifier: "DeclarationDetail", sender: nil)
        
        print(DeclarationManager.shared.reportType)
        print(DeclarationManager.shared.productIdx)

       }
    
    
    
}
