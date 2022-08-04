//
//  WishListResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation

struct WishListResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: WishListInfo
}

// MARK: - Result
struct WishListInfo: Decodable {
    let collectionList: [CollectionList]
    let productList: [ProductList]
}

// MARK: - CollectionList
struct CollectionList: Decodable {
    let collectionIdx: Int
    let images: [String]
    let name: String
    let productNum: Int
}

// MARK: - ProductList
struct ProductList: Decodable {
    let productIdx: Int
    let productImageURL: String
    let productName: String
    let price, storeIdx: Int
    let storeImageURL: String
    let storeName: String
    let safePay: Int
    let status: String

    enum CodingKeys: String, CodingKey {
        case productIdx
        case productImageURL = "productImageUrl"
        case productName, price, storeIdx
        case storeImageURL = "storeImageUrl"
        case storeName, safePay, status
    }
}
