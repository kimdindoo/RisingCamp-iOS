//
//  PowerShoppingModel.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/29.
//

import Foundation

struct PowerShoppingModel {
    let productImage: String
    let price: Int
    let name: String
}

extension PowerShoppingModel {
    static let list: [PowerShoppingModel] = [
        PowerShoppingModel(productImage: "1", price: 30000, name: "플로레비다 더 로즈 가드너 핸드크림 2종"),
        PowerShoppingModel(productImage: "2", price: 15000, name: "플로레비다 더 로즈 가드너 핸드크림 50ml"),
        PowerShoppingModel(productImage: "3", price: 30000, name: "[핸드크림 세트] 제이멜라 인 프랑스 베이보릿 퍼퓸 핸드 크림 세트"),
        PowerShoppingModel(productImage: "4", price: 5900, name: "[지아자 공식몰] 산양유 핸드크림 80ml"),
        PowerShoppingModel(productImage: "5", price: 15000, name: "[비오템] 비오멩 핸드크림 50ml"),
        PowerShoppingModel(productImage: "6", price: 16000, name: "오픈더센트 퍼퓸 명품 향수 핸드크림 50ml"),
        PowerShoppingModel(productImage: "7", price: 13000, name: "제이멜라 페이보릿+시그니처 퍼퓸 핸드크림 세트"),
        PowerShoppingModel(productImage: "8", price: 15000, name: "[핸드크림 세트] 제이멜라 인 프랑스 시그니처 퍼퓸 핸드크림 세트"),
        PowerShoppingModel(productImage: "9", price: 13000, name: "[러퓸] 핸드 크림 세트"),


    ]
}
