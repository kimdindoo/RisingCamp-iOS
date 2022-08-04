//
//  RecommendedBrandManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Alamofire

class RecommendedBrandManager {
    
    func getBrandData(_ tabManSecondViewController: TabManSecondViewController) {
        let url = "\(Constant.BASE_URL)/app/brands/recommend"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: RecommendedBrandResponse.self) { response in
                switch response.result {
                case .success(let response):
                    tabManSecondViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    

    
}
