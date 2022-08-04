//
//  AccountSetResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/27.
//

import Foundation

struct AccountSetResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: AccountSetInfo
}

// MARK: - Result
struct AccountSetInfo: Decodable {
    let gender, birth, phoneNum, authMethod: String
}
