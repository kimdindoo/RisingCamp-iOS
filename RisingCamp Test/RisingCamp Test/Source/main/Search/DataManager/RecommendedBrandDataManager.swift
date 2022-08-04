//
//  recommendedBrandDataManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Foundation
import Alamofire

class RecommendedBrandDataManager {
    
    func getSearchBrandData(_ searchViewController: SearchViewController) {
        let url = "\(Constant.BASE_URL)/app/brands/searches/recommend"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: SearchBrandResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("호출 성공")
                    searchViewController.didSuccessSearchBrand(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

    
}


