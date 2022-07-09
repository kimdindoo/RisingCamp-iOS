//
//  RestaurantInfo.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/10.
//

import Foundation

struct RestaurangData {
    let Rname: String
    let imageName: String
    let distance: String
    let viewer: Int
    let written: Int
}

extension RestaurangData {
    static let list = [
        RestaurangData(Rname: "1. 써리얼파스타바", imageName: "파스타", distance: "의왕시 2.32km", viewer: 13724, written: 16),
        RestaurangData(Rname: "2. 써리얼파스타바", imageName: "파스타", distance: "의왕시 2.32km", viewer: 13724, written: 16),
        RestaurangData(Rname: "3. 써리얼파스타바", imageName: "파스타", distance: "의왕시 2.32km", viewer: 13724, written: 16),
        RestaurangData(Rname: "4. 써리얼파스타바", imageName: "파스타", distance: "의왕시 2.32km", viewer: 13724, written: 16),
        RestaurangData(Rname: "5. 써리얼파스타바", imageName: "파스타", distance: "의왕시 2.32km", viewer: 13724, written: 16),


    
    
    ]
}
