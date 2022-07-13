//
//  WeatherInformation.swift
//  Weather
//
//  Created by 김진수 on 2022/05/19.
//

import Foundation

struct BusanFood: Decodable {
    let restaurang: [Restaurang]
    
    enum CodingKeys: String, CodingKey {
        case restaurang = "body"
    }
}



struct Restaurang: Decodable {
    let Rname: String
    let adress: String


    enum CodingKeys: String, CodingKey {
        case Rname = "RSTR_NM"
        case adress = "AREA_NM"

    }
}
