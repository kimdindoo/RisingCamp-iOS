//
//  MovieAPIViewController.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/12.
//

import UIKit

class MovieAPIViewController: UIViewController {

    @IBOutlet weak var rankLabel: UILabel!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var openDate: UILabel!
    
    @IBOutlet weak var audiAcc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func tapPatchMovieButton(_ sender: Any) {
//        MovieRequest().getMovieData(self)
    }
    
//    func didSuccess(_ response: MovieResponse) {
//        rankLabel.text = response.boxOfficeResult?.dailyBoxOfficeList?[1].rank ?? ""
//        movieName.text = response.boxOfficeResult?.dailyBoxOfficeList?[1].movieNm ?? ""
//        openDate.text = response.boxOfficeResult?.dailyBoxOfficeList?[1].openDt ?? ""
//        audiAcc.text = response.boxOfficeResult?.dailyBoxOfficeList?[1].audiAcc ?? ""
//
//    }
}
