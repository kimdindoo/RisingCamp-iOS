//
//  FollowBrandManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation
import Alamofire

class FollowBrandManager {
    
    func getFollowBrand(_ tabManSecondViewController: TabManSecondViewController) {
        let url = "\(Constant.BASE_URL)/app/brands/follow"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NTgzMjc0NjcsImV4cCI6MTY1OTc5ODY5Nn0.YejDtNZjgk4RACjL0kMhIjDYh_IVUENHdOEoQ47CJD4"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: FollowBrandResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    tabManSecondViewController.didSuccessFollowBrand(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    
    
}
