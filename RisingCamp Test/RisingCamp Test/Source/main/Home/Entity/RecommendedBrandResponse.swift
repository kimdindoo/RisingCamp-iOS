//
//  RecommendedBrandResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Foundation
import Alamofire

// MARK: - RecommendedBrandResponse
struct RecommendedBrandResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [CategoryInfo]
}

// MARK: - Result
struct CategoryInfo: Decodable {
    var brandIdx: Int
    var koreanName, englishName: String
    var productNum: Int
    var imageURL: String
    var products: [ProductInfo]
    var followed: Bool

    enum CodingKeys: String, CodingKey {
        case brandIdx, koreanName, englishName, productNum
        case imageURL = "imageUrl"
        case products, followed
    }
}

// MARK: - Product
struct ProductInfo: Decodable {
    var productIdx: Int
    var imageURL: String
    var like, price: Int
    var name: String
    var region: Region
    var elapsedTime: String
    var safePay, likeNum: Int

    enum CodingKeys: String, CodingKey {
        case productIdx
        case imageURL = "imageUrl"
        case like, price, name, region, elapsedTime, safePay, likeNum
    }
}

enum Region: String, Codable {
    case 성남시수내1동 = "성남시 수내1동"
    case 성남시신흥동 = "성남시 신흥동"
    case 성남시이매동 = "성남시 이매동"
}

