//
//  RecentSearchesResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Foundation

struct RecentSearchesResponse: Decodable {
    
    
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: [RecentWord]
    
}

struct RecentWord: Decodable {
    
    let searchIdx: Int
    let searchWord: String
}
