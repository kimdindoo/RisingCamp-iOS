//
//  AccountSetMaqnager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation
import Alamofire

class AccountSetManager {
    
    static let shared = AccountSetManager()
    
    var gender: String = ""
    var birth: String = ""
    var phoneNum: String = ""


    
    
    private func makeParameter(gender: String, birth: String, phoneNum: String) -> Parameters
        {
            return [
                
                    "gender" : gender,
                    "birth" : birth,
                    "phoneNum" : phoneNum,
        
                    
                    ]
        }
    
    // 계정 설정 전 정보 가져오기
    func getAccountInfo(_ accountSetViewController: AccountSetViewController ) {
        let url = "\(Constant.BASE_URL)/app/users/1/settings"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NTgxMTgxNjksImV4cCI6MTY1OTU4OTM5OH0.Mdjj9w9vbjQnKYbk51Sf_gIn_bvJzChayChHFx0HMJ4"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: AccountSetResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    accountSetViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
    
    
    
    // 계정 설정하기
    func patchAccountInfo() {
        let url = "\(Constant.BASE_URL)/app/users/1/settings"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]

        AF.request(url, method: .patch, parameters:makeParameter(gender: gender, birth: birth, phoneNum: phoneNum), encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("계정 수정 성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
            }
        
        }
    
    
    
}

