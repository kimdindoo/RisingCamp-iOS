//
//  RelatedProductResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation

struct RelatedProductResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [RelatedProductInfo]
}



// MARK: - Result
struct RelatedProductInfo: Decodable {
    let productId: Int
    let imageUrl: String
    let price: Int
    let name: String
    let isLike, isSafePayment: Int
    let tag: String


}
