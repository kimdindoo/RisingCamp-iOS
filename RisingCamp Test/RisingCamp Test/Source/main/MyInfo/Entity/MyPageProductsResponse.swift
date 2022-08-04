//
//  MyPageResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation

struct MyPageProductsResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [MyPageProducts]
}


// MARK: - Result
struct MyPageProducts: Decodable {
    let productIdx: Int
    let imageURL: String
    let like, price: Int
    let name: String
    let region: String
    let elapsedTime: String
    let safePay, likeNum: Int

    enum CodingKeys: String, CodingKey {
        case productIdx
        case imageURL = "imageUrl"
        case like, price, name, region, elapsedTime, safePay, likeNum
    }
}


