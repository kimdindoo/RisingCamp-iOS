//
//  ProductDetailManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/26.
//

import Foundation
import Alamofire

class  ProductDetailManager {
    
    static let shared = ProductDetailManager()
    
    var id: Int = 0

//    func getProductDetailData(_ productDetailViewController: ProductDetailViewController) {
//        let url = "\(Constant.BASE_URL)/app/products/2"
//
//        let header: HTTPHeaders = [ "Content-Type":"application/json",
//                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NTg0MzA5NzYsImV4cCI6MTY1OTkwMjIwNX0.CwlHfkIZsF3S-Q-qa_M9KLuK4luhefUtFEjMoVPrWzQ"]
//
//        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
//            .validate()
//            .responseDecodable(of: ProductDetailResponse.self) { response in
//                switch response.result {
//                case .success(let response):
//                    print(response)
//                    productDetailViewController.didSuccess(response)
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            }
//        }
    
    func getProductDetailData2(_ productDetailViewController:ProductDetailViewController, productIdx: Int) {
        
        let url = "\(Constant.BASE_URL)/app/products/\(productIdx)"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo2LCJpYXQiOjE2NTg0MzA5NzYsImV4cCI6MTY1OTkwMjIwNX0.CwlHfkIZsF3S-Q-qa_M9KLuK4luhefUtFEjMoVPrWzQ"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: ProductDetailResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    productDetailViewController.didSuccess(response)

                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }

    
}
