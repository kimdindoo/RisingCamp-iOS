//
//  DeclarationManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation
import Alamofire

class DeclarationManager {
    
    static let shared = DeclarationManager()
    
    var productIdx: Int = 0
    var reportType: Int = 0
    var detailReason: String = ""
    
    private func makeParameter(reportType : Int, detailReason : String) -> Parameters
        {
            return ["reportType" : reportType,
                    "detailReason" : detailReason]
        }
    
    func postDeclaration(reportType : Int, detailReason : String) {
        let url = "\(Constant.BASE_URL)/app/products/report/\(productIdx)"

        AF.request(url, method: .post, parameters: makeParameter(reportType: reportType, detailReason: detailReason), encoding: JSONEncoding.default)
            .validate()
            .responseData { response in
                switch response.result {
                case .success:
                    print("신고하기 성공")
                case .failure(let error):
                    print(error.localizedDescription)
                }
        
            }
        
        }
    
    
}
