//
//  BusanFoodImage.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/14.
//

import Foundation

import Foundation

struct BusanFoodImage: Decodable {
    let bfImage: [Image]
    
    enum CodingKeys: String, CodingKey {
        case bfImage = "body"
    }
}



struct Image: Decodable {
    let image: String


    enum CodingKeys: String, CodingKey {
        case image = "FOOD_IMG_URL"

    }
}
