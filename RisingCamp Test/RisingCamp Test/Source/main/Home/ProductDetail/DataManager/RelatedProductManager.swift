//
//  RelatedProductManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation
import Alamofire

class RelatedProductManager {
    
    static let shared = RelatedProductManager()

    var id: Int = 0
    
    func getProductDetailData2(_ productDetailViewController:ProductDetailViewController, productIdx: Int) {
    
    let url = "\(Constant.BASE_URL)/app/products/\(productIdx)/relation"
    
    let header: HTTPHeaders = [ "Content-Type":"application/json",
                                "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
    
    AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
        .validate()
        .responseDecodable(of: RelatedProductResponse.self) { response in
            switch response.result {
            case .success(let response):
                print(response)
                productDetailViewController.didSuccessRelatedProduct(response)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
