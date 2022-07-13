//
//  MovieRequest.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/12.
//

import Foundation
import Alamofire

class MovieRequest {
    func getMovieData(_ movieAPIViewController: MovieAPIViewController) {
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20220701"
        
        AF.request(url, method: .get, headers: nil).responseDecodable(of: MovieResponse.self) { response in
            
            switch response.result {
                
            case .success(let response):
                print("\(response)")
                movieAPIViewController.didSuccess(response)
                
                
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
            
        }
        
        
        
    }
}
