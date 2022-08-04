//
//  FollowBrandManager.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation

struct FollowBrandResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [FollowBrandInfo]
}

// MARK: - Result
struct FollowBrandInfo: Decodable {
    let brandIdx: Int
    let koreanName, englishName: String
    let productNum: Int
    let imageURL: String
    let products: [FollowBrandProduct]
    let followed: Bool

    enum CodingKeys: String, CodingKey {
        case brandIdx, koreanName, englishName, productNum
        case imageURL = "imageUrl"
        case products, followed
    }
}

// MARK: - Product
struct FollowBrandProduct: Decodable {
    let productIdx: Int
    let imageURL: String
    let like, price: Int
    let name, region, elapsedTime: String
    let safePay, likeNum: Int

    enum CodingKeys: String, CodingKey {
        case productIdx
        case imageURL = "imageUrl"
        case like, price, name, region, elapsedTime, safePay, likeNum
    }
}
