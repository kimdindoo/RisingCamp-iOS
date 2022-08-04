//
//  RecommendedProduct.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/21.
//

import Alamofire

class RecommendedProductManager {
    
    func getProductData(_ tabManFirstViewController: TabManFirstViewController) {
        let url = "\(Constant.BASE_URL)/app/products/recommend"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: RecommendedProductResponse.self) { response in
                switch response.result {
                case .success(let response):
                    tabManFirstViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
}
