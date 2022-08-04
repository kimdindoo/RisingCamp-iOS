//
//  ModifyStoreManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Foundation
import Alamofire

class ModifyStoreManager {
    
    static let shared = ModifyStoreManager()
    
    var storeName: String = ""
    var shopUrl: String = ""
    var contactTime: String = ""
    var policy: String = ""
    var description: String = ""
    var precautions: String = ""

    
    
    private func makeParameter(storeName : String, shopUrl : String, contactTime : String, description : String, policy : String, precautions : String) -> Parameters
        {
            return [
                
                    "storeName" : storeName,
                    "shopUrl" : shopUrl,
                    "contactTime" : contactTime,
                    "policy" : policy,
                    "description" : description,
                    "precautions" : precautions,
                    
                    ]
        }
    
    // 상점 정보 수정 전에 정보 가져오기
    func getModifyStore(_ modifyStoreViewController: ModifyStoreViewController ) {
        let url = "\(Constant.BASE_URL)/app/users/modify/stores/1"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: ModifyStoreResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    modifyStoreViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
    

    // 상점 정보 수정하기
    func patchModifyStore() {
        let url = "\(Constant.BASE_URL)/app/users/modify/stores/1"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]

        AF.request(url, method: .patch, parameters:makeParameter(storeName: storeName, shopUrl: shopUrl, contactTime: contactTime, description: description, policy: policy, precautions: precautions), encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("상점 수정 성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
            }
        
        }
    
    
    
    
    
    
}
