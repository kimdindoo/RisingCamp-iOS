//
//  FollowingResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation

struct FollowingResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [FollowingInfo]
}

// MARK: - Result
struct FollowingInfo: Decodable {
    let id: Int
    let imageURL: String
    let storeName: String
    let productsNum, followerNum: Int
    let getFavoriteUserProductsDetailResList: [GetFavoriteUserProductsDetailResList]

    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "imageUrl"
        case storeName, productsNum, followerNum, getFavoriteUserProductsDetailResList
    }
}

// MARK: - GetFavoriteUserProductsDetailResList
struct GetFavoriteUserProductsDetailResList: Decodable {
    let imageURL: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case imageURL = "imageUrl"
        case price
    }
    
}
