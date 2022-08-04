//
//  ModifyStoreResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/24.
//

import Foundation

struct ModifyStoreResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: storeInfo
}

// MARK: - Result
struct storeInfo: Decodable {
    let imageUrl: String
    let storeName: String
    let shopUrl: String
    let contactTime: String
    let description: String
    let policy: String
    let precautions: String

    
}
