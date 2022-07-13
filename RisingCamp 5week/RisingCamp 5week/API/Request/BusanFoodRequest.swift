//
//  BusanFoodRequest.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/14.
//

import Alamofire
import Foundation


class BusanFoodRequest {
    
    func getBusanFoodData(_ findGRViewController: FindGRViewController) {
        let url = "https://busan-7beach.openapi.redtable.global/api/menu-dscrn/korean?serviceKey=xzqcWBUrj1hkj2qcRhf1KMbb3zEFip86I0yJ8O1b9je5i9W8p9rlNoNr5ACt7l5M"
        
        // HTTP Method: Get
        AF.request(url,
                   method: .get,
                   headers: nil)
        .responseDecodable(of: BusanFood.self) { response in
            
            switch response.result {
                
            case .success(let response):
                print("\(response)")
                findGRViewController.didSuccess(response)
                
            case .failure(let error):
                print("\(error.localizedDescription)")
            
            }
        }
    }
    

}
