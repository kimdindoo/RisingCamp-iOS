//
//  ProductDetailResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/26.
//

import Foundation
import Alamofire

struct ProductDetailResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: ProductDetailInfo
    
    
    
}

// MARK: - Result
struct ProductDetailInfo: Decodable {
    let productIdx, price: Int
    let name: String
    let like: Int
    let region, elapsedTime: String
    let isDeliveryIncluded, count, isOld, isExchangeAvailable: Int
    let description: String
    let isSafePayment, likeNum: Int
    let images: [String]
    let tags: [String]
    let status: String
    let storeInfo: StoreInfo
    let reviewNum: Int
    let reviews: [String]
    let inqueryNum: Int

    
}

// MARK: - StoreInfo
struct StoreInfo: Decodable {
    let storeIdx: Int
    let storeImageUrl: String
    let storeName: String
    let ratings, followerNum: Int
    let followed: Bool
    let productNum: Int
    let products: [String]
    
}
