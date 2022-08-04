//
//  recommendedBrandResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Foundation

// MARK: - RecommendedBrandResponse
struct SearchBrandResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [SearchBrand]
}

// MARK: - Result
struct SearchBrand: Decodable {
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
