//
//  brandListManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/25.
//

import Foundation
import Alamofire

class BrandListManager {
    
    
    func getBrandList(_ allMenuBrandViewController: AllMenuBrandViewController) {
        let url = "\(Constant.BASE_URL)/app/brands?order=korean&follow=false"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: BrandListResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("호출 성공")
                    print(response)
                    allMenuBrandViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    
}
