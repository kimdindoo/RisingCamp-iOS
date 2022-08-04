//
//  FollowingManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation
import Alamofire

class FollowingManager {
    
    func getStorefollowing(_ followingViewController: FollowingViewController ) {
        let url = "\(Constant.BASE_URL)/app/favorites/1/users"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NTgxMTgxNjksImV4cCI6MTY1OTU4OTM5OH0.Mdjj9w9vbjQnKYbk51Sf_gIn_bvJzChayChHFx0HMJ4"]
        
        AF.request(url, method: .get,encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: FollowingResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    followingViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }

}
