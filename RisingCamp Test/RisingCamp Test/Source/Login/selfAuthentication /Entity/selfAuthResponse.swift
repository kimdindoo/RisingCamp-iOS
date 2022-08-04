//
//  selfAuthResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/21.
//

import Foundation

// 문자인증 요청후
struct messeageRequestResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Int
}

//{
//    "isSuccess": true,
//    "code": 1000,
//    "message": "요청에 성공하였습니다.",
//    "result": "344347"
//}

// 문자인증 확인 후
struct messageConfirmResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
}

//{
//    "isSuccess": true,
//    "code": 1000,
//    "message": "요청에 성공하였습니다."
//}

struct loginResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: Result
}

struct Result: Decodable {
    let userIdx: Int
    let jwt: String
    let login: Bool
}
