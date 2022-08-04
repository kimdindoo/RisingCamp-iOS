//
//  BungaeTalkModel.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/29.
//

import Foundation

struct BungaeTalkModel {
    let name: String
    let chat: String
    let date: String
    let profileImage: String
}

extension BungaeTalkModel {
    static let list: [BungaeTalkModel] = [
        BungaeTalkModel(name: "손흥민", chat: "축구화 팔아요", date: "7/29" , profileImage: "손흥민.jpeg"),
        BungaeTalkModel(name: "진구", chat: "안경 구매 할게요", date: "7/28" , profileImage: "진구.jpeg"),
        BungaeTalkModel(name: "도라에몽", chat: "모든 물건 다 있어요", date: "7/28" , profileImage: "도라에몽.jpeg"),
        BungaeTalkModel(name: "손흥민팬", chat: "손흥민 싸인 유니폼 있나요?", date: "7/27" , profileImage: "프로필기본"),
        BungaeTalkModel(name: "퉁퉁이", chat: "배고파요", date: "7/27" , profileImage: "퉁퉁이.jpeg"),
        BungaeTalkModel(name: "비실이", chat: "다 살게요", date: "7/26" , profileImage: "비실이.jpeg"),

        BungaeTalkModel(name: "아이패드", chat: "아이패드 사고 싶어요", date: "7/25" , profileImage: "프로필기본"),
        BungaeTalkModel(name: "맥북구매", chat: "맥북 사고 싶어요", date: "7/22" , profileImage: "프로필기본"),



    ]
}
