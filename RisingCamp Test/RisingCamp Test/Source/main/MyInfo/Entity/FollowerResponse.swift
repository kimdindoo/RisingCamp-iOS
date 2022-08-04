//
//  FollowerResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation

struct FollowerResponse: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [followerInfo]?
}

// MARK: - Result
struct followerInfo: Decodable {
    let imageUrl: String?
    let storeName: String?
    let productNum: Int?
    let followingNum: Int?


}

