//
//  FollowerManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation
import Alamofire

class FollowerManager {
    
    func getStorefollowers(_ followerViewController: FollowerViewController ) {
        let url = "\(Constant.BASE_URL)/app/favorites/1/favorites"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NTgxMTgxNjksImV4cCI6MTY1OTU4OTM5OH0.Mdjj9w9vbjQnKYbk51Sf_gIn_bvJzChayChHFx0HMJ4"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: FollowerResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    followerViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
    
    
    
}
