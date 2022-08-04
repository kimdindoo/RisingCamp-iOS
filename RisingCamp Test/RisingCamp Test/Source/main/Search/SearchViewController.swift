//
//  SearchViewController.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/16.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var recentKeyword: UIButton!
    @IBOutlet var popularKeyword: [UIButton]!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!


    
    let searchBrandInfos: [SearchBrandInfo] = SearchBrandInfo.list
    
//    var data: [RecentWord] = []
    var data2: [RecentWord] = []
    var brandData: [SearchBrand] = []
    
//    lazy var dataManager: RecentSearchesManager = RecentSearchesManager()
    lazy var dataManager2: HotSearchesManager = HotSearchesManager()
    lazy var dataManager3: RecommendedBrandDataManager = RecommendedBrandDataManager()

    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 탭바 숨기기
        self.tabBarController?.tabBar.isHidden = true
        
        recentKeyword.layer.borderWidth = 1
        recentKeyword.layer.borderColor = UIColor.lightGray.cgColor
        recentKeyword.layer.cornerRadius = 5
        

        setPopularKeywordUI()

        setNC()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        dataManager.getRecentSearchesData(self)
        dataManager2.getHotSearchesData(self)
        dataManager3.getSearchBrandData(self)
        
//        print(data.count)
        
//        button1.setTitle(data2[0].searchWord, for: .normal)
//        button2.setTitle(data2[1].searchWord, for: .normal)
//        button3.setTitle(data2[2].searchWord, for: .normal)
//        button4.setTitle(data2[3].searchWord, for: .normal)
//        button5.setTitle(data2[4].searchWord, for: .normal)
//        button6.setTitle(data2[5].searchWord, for: .normal)
//        button7.setTitle(data2[6].searchWord, for: .normal)
//        button8.setTitle(data2[7].searchWord, for: .normal)
//        button9.setTitle(data2[8].searchWord, for: .normal)
//        button10.setTitle(data2[9].searchWord, for: .normal)

//        print(data2[0].searchWord)
//        print(data2)


    }
    
//    func didSuccess(_ response: RecentSearchesResponse) {
//        self.data = response.result
//        
//    }
    
    func didSuccess2(_ response: RecentSearchesResponse) {
        self.data2 = response.result
 
        button1.setTitle(data2[0].searchWord, for: .normal)
        button2.setTitle(data2[1].searchWord, for: .normal)
        button3.setTitle(data2[2].searchWord, for: .normal)
        button4.setTitle(data2[3].searchWord, for: .normal)
        button5.setTitle(data2[4].searchWord, for: .normal)
        button6.setTitle(data2[5].searchWord, for: .normal)
        button7.setTitle(data2[6].searchWord, for: .normal)
        button8.setTitle(data2[7].searchWord, for: .normal)
        button9.setTitle(data2[8].searchWord, for: .normal)
        button10.setTitle(data2[9].searchWord, for: .normal)
    }
    
    func didSuccessSearchBrand(_ response: SearchBrandResponse) {
        self.brandData = response.result
        print(brandData)
        self.tableView.reloadData()
    }

    func setNC() {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
//
//        view.backgroundColor = .brown
        
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
        
        textField.placeholder = "검색어를 입력해주세요"
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        
        self.navigationItem.titleView = textField
    }
    
    func setPopularKeywordUI() {
        for i in popularKeyword {
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.lightGray.cgColor
            i.layer.cornerRadius = 5
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        
    }
    
//    @IBAction func goHome(_ sender: Any) {
//
//                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//                let mainViewController = storyboard.instantiateViewController(identifier: "HomeViewController")
//                mainViewController.modalPresentationStyle = .fullScreen
//                self.navigationController?.pushViewController(mainViewController, animated: true)
//    }
    


    
}
 
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return brandData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBrandCell") as? SearchBrandCell else {
            return UITableViewCell()
        }
        
        let brand = brandData[indexPath.item]

        cell.configure(brand)
    
//
//        cell.brandKoNameLabel.text = brandData[indexPath.row].koreanName
//        cell.brandEnNameLabel.text = brandData[indexPath.row].englishName
//        cell.amountLabel.text = "\(brandData[indexPath.row].productNum)"
//        thumbnailImageView.image = UIImage(named: info.imageURL)
        

        
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        }

        return UITableView.automaticDimension
    }
    
}
