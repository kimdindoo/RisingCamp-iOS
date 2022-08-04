//
//  MyPageResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/29.
//

import Foundation

struct MyPageResponse: Decodable {
    let isSuccess: Bool
     let code: Int
     let message: String
     let result: MyPageInfo
 }

 // MARK: - Result
 struct MyPageInfo: Decodable {
     let name: String
     let isCertified: Int
     let imageURL: String
     let ratings, likeNum, reviewNum, followerNum: Int
     let followingNum: Int

     enum CodingKeys: String, CodingKey {
         case name, isCertified
         case imageURL = "imageUrl"
         case ratings, likeNum, reviewNum, followerNum, followingNum
     }
 }
