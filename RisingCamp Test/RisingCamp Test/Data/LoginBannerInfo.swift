//
//  LoginBannerInfo.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/17.
//

import Foundation

struct LoginBannerInfo: Hashable {
    let title: String
    let title2: String

    let description: String
    let description2: String

    let imageName: String
}

//extension LoginBannerInfo {
//    static let list = [
//        LoginBannerInfo(title: "취향을 잇는 거래,번개장터", description: "요즘 유행하는 메이저 취향부터 나만 알고 싶은 마이너 취향까지", imageName: "로그인화면1"),
//        LoginBannerInfo(title: "안전하게 취향을 잇습니다.", description: "번개톡, 번개페이로 거래의 시작부터 끝까지 안전하게", imageName: "로그인화면2"),
//        LoginBannerInfo(title: "편리하게 취향을 잇습니다.", description: "포장택배 서비스로 픽업/포장/배송을 한번에", imageName: "로그인화면3"),
//        LoginBannerInfo(title: "번개장터에서 취향을 거래해보세요.", description: "지금 바로 번개장터에서 당신의 취향에 맞는 아이템들을 찾아보세요!", imageName: "로그인화면4"),
//
//    ]
//}

extension LoginBannerInfo {
    static let list = [
        LoginBannerInfo(title: "취향을 잇는 거래,", title2: "번개장터", description: "요즘 유행하는 메이저 취향부터", description2: "나만 알고 싶은 마이너 취향까지", imageName: "로그인화면1"),
        LoginBannerInfo(title: "안전하게", title2: "취향을 잇습니다.", description: "번개톡, 번개페이로", description2: "거래의 시작부터 끝까지 안전하게", imageName: "로그인화면2"),
        LoginBannerInfo(title: "편리하게", title2: "취향을 잇습니다.", description: "포장택배 서비스로", description2: "픽업/포장/배송을 한번에", imageName: "로그인화면3"),
        LoginBannerInfo(title: "번개장터에서", title2: "취향을 거래해보세요.", description: "지금 바로 번개장터에서", description2: "당신의 취향에 맞는 아이템들을 찾아보세요!", imageName: "로그인화면4"),


    ]
}
