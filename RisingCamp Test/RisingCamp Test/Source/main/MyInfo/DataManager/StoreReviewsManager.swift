//
//  StoreReviewsManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation
import Alamofire

class StoreReviewsManager {
    
    
    func getStoreReviews(_ storeReviewsViewController: StoreReviewsViewController ) {
        let url = "\(Constant.BASE_URL)/app/reviews/1"
   
        
        AF.request(url, method: .get,encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: StoreReviewsResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print(response)
                    storeReviewsViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
        
            }
        
    }
        
        
}
