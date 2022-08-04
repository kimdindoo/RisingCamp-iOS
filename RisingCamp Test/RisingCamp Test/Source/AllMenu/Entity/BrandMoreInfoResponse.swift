//
//  BrandMoreInfoResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation

struct BrandMoreInfoResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [BrandMoreInfo]
}

// MARK: - Result
struct BrandMoreInfo: Decodable {
    let imageURL: String
    let name, englishName: String
    let isFollow: Int
    let getProductInfo: [GetProductInfo]

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case name, englishName, isFollow, getProductInfo
    }
}

// MARK: - GetProductInfo
struct GetProductInfo: Decodable {
    let productID: Int
    let imageURL: String
    let price, isLike: Int
    let name: String
    let isSafePayment: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case imageURL = "imageUrl"
        case price, isLike, name, isSafePayment
    }
}
