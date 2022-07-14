//
//  NewsViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var testView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var tasteButton1: UIButton!
    @IBOutlet weak var tasteButton2: UIButton!
    @IBOutlet weak var tasteButton3: UIButton!

    @IBOutlet weak var RnameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellSpacingHeight: CGFloat = 5

    var data: [DailyBoxOfficeList] = []
    let list: [MovieImageData] = MovieImageData.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCustom()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        self.tableView?.rowHeight = UITableView.automaticDimensMovieImageDataion
        self.tableView?.estimatedRowHeight = UITableView.automaticDimension
        
        MovieRequest().getMovieData(self)

//        let text:String = RnameLabel.text ?? ""
//        let attributedString = NSMutableAttributedString.init(string: "\(text)네맞아요")
//        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range: NSRange.init(location: text.count, length: 4))
//        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: 1, range: NSRange.init(location: text.count, length: 4))
//        RnameLabel.attributedText = attributedString
//
    }
    
    func didSuccess(_ response: MovieResponse) {
        self.data = response.boxOfficeResult!.dailyBoxOfficeList!
        tableView.reloadData()
    }

    
    func buttonCustom() {
//        testView.layer.borderWidth = 1.0
//        testView.layer.borderColor = UIColor.lightGray.cgColor
        
        progressBar.trackTintColor = UIColor.white
        
        tasteButton1.layer.cornerRadius = 13
        tasteButton1.clipsToBounds = true
        tasteButton1.layer.borderWidth = 1.0
        tasteButton1.layer.borderColor = UIColor(named: "customOrange")?.cgColor


        tasteButton2.layer.cornerRadius = 13
        tasteButton2.clipsToBounds = true
        tasteButton2.layer.borderWidth = 1.0
        tasteButton2.layer.borderColor = UIColor(named: "customOrange")?.cgColor
        
        tasteButton3.layer.cornerRadius = 13
        tasteButton3.clipsToBounds = true
        tasteButton3.layer.borderWidth = 1.0
        tasteButton3.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        
//        cell.RnameLabel.text = data[indexPath.row].cmpnm
//        cell.menuLabel.text = data[indexPath.row].mnmnu
        


        cell.RnameLabel.text = data[indexPath.row].movieNm
        cell.locationLabel.text = data[indexPath.row].rank
        cell.contentsLabel.text = data[indexPath.row].openDt
        
        let movieImages = list[indexPath.item]
        cell.configure(movieImages)
                                                
        return cell
    }
    
    
    
    
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 500
        }
     

        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

        return 200
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        return UIView()
    }
 
}
