//
//  BrandMoreInfoManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation
import Alamofire

class BrandMoreInfoManager {
    
    static let shared = BrandMoreInfoManager()
    
    var id: Int = 0
    
    func getBrandMoreInfo(_ brandMoreInfoViewController: BrandMoreInfoViewController, brandId: Int) {
        let url = "\(Constant.BASE_URL)/app/searchs/1/\(brandId)"
        
        let header: HTTPHeaders = [ "Content-Type":"application/json",
                                    "X-ACCESS-TOKEN":"eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NTgxMTgxNjksImV4cCI6MTY1OTU4OTM5OH0.Mdjj9w9vbjQnKYbk51Sf_gIn_bvJzChayChHFx0HMJ4"]
        
        AF.request(url, method: .get ,parameters: nil, encoding: JSONEncoding.default, headers: header)
            .validate()
            .responseDecodable(of: BrandMoreInfoResponse.self) { response in
                switch response.result {
                case .success(let response):
                    print("호출 성공")
                    print(response)
                    brandMoreInfoViewController.didSuccess(response)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    
    
}
