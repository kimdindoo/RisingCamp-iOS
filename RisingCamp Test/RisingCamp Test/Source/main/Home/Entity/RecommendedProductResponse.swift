//
//  RecommendedProductResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/21.
//

import Foundation

struct RecommendedProductResponse: Decodable {
    let result: [Product]
}

struct Product: Decodable {
    
    let productIdx: Int
    let imageUrl: String
    let like: Int
    let price: Int
    let name: String
    let region: String
    let elapsedTime: String
    let safePay: Int
    let likeNum: Int
//    "productIdx": 4,
//    "imageUrl": "https://media.bunjang.co.kr/product/193815126_1_1658138559_w292.jpg",
//    "like": 0,
//    "price": 7000,
//    "name": "BE 에센셜 에디션 양도",
//    "region": "성남시 사송동",
//    "elapsedTime": "20시간전",
//    "safePay": 1,
//    "likeNum": 1
    
}
