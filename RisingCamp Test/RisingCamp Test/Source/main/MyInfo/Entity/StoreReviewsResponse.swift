//
//  StoreReviewsResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation

struct StoreReviewsResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [reviewInfo]
}

// MARK: - Result
struct reviewInfo: Decodable {
    let reviewID: Int
    let imageURL: String
    let id: Int
    let storeName: String
    let reviewScore: Int
    let reviewText, name, createdAt: String
    let comment: Comment?
    let reviewImages: [ReviewImage]?

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case imageURL = "imageUrl"
        case id, storeName, reviewScore, reviewText, name, createdAt, comment, reviewImages
    }
}

// MARK: - Comment
struct Comment: Decodable {
    let storeName, commentText, createdAt: String
}

// MARK: - Decodable
struct ReviewImage: Codable {
    let reviewID: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case imageURL = "imageUrl"
    }
}
