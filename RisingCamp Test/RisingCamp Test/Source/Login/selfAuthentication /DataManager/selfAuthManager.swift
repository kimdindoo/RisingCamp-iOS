//
//  selfAuthManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/21.
//

import Foundation
import Alamofire

class selfAuthManager {
    
    static let shared = selfAuthManager()
    
    private func makeParameter(name : String, phoneNum : String) -> Parameters
        {
            return ["name" : name,
                    "phoneNum" : phoneNum]
        }
    
    // 1. 본인 인증 문자 요청 API(POST)
    func postMessageAuth(name: String, phoneNum: String ) {
        let url = "\(Constant.BASE_URL)/app/sms"

        AF.request(url, method: .post, parameters: makeParameter(name: name, phoneNum: phoneNum), encoding: JSONEncoding.default)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("POST 문자보내기 성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
            }
        
        }
    
    // 2. 본인 인증 문자 확인코드 확인 API(GET)
    func getMessageAuth(vc: MyInfoLoginViewController, code: String , phoneNum: String) {
        let url = "\(Constant.BASE_URL)/app/sms/\(phoneNum)?code=\(code)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: messageConfirmResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    vc.didSuccess(result: response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
        }
    
    
    // 3. 로그인/회원가입 API(POST)
    func postLogin(name: String, phoneNum: String, vc: MyInfoLoginViewController) {
        let url = "\(Constant.BASE_URL)/app/users"
        
        

        AF.request(url, method: .post, parameters: makeParameter(name: name, phoneNum: phoneNum), encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: loginResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    vc.didSuccess2(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
            }
        
        }
    
    // 4. 회원가입 - 상점이름 설정API(POST)
    func postStoreName(storeName: String,  vc: StoreNameViewController) {
//        let url = "\(Constant.BASE_URL)/app/users/store?storename=\(storeName)"
        
        let urlStr = "\(Constant.BASE_URL)/app/users/store?storename=\(storeName)"
        guard let encodedStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        let url = URL(string: encodedStr)!
        print(url.absoluteString)
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"\(Constant.jwtToken)"]

        AF.request(url, method: .post, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("상점 이름정하기 성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
            }
        
        }
    
    
    
}
