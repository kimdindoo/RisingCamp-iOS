//
//  MyForSaleDataManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation
import Alamofire

class MyPageProductsManager {
    
    // 마이페이지 - 판매중 상품
    func getForSalePrduct(_ myForSaleViewController: MyForSaleViewController ) {
        let url = "\(Constant.BASE_URL)/app/users/mypage/products?status=sale"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyPageProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    myForSaleViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
    
    // 마이페이지 - 예약중 상품
    func getReservedPrduct(_ reservedViewController: ReservedViewController ) {
        let url = "\(Constant.BASE_URL)/app/users/mypage/products?status=reserve"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyPageProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    reservedViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
    
    // 마이페이지 - 판매완료 상품
    func getSoldOutPrduct(_ soldOutViewController: SoldOutViewController ) {
        let url = "\(Constant.BASE_URL)/app/users/mypage/products?status=sold-out"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: MyPageProductsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    soldOutViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
    
}
