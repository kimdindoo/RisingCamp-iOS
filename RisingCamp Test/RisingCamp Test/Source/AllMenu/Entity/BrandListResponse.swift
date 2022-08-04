//
//  brandListResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/25.
//

import Foundation

struct BrandListResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BrandList]
}

// MARK: - Result
struct BrandList: Decodable {
    let brandIdx: Int
    let koreanName, englishName: String
    let productNum: Int
    let imageURL: String
    let followed: Bool

    enum CodingKeys: String, CodingKey {
        case brandIdx, koreanName, englishName, productNum
        case imageURL = "imageUrl"
        case followed
    }
}
