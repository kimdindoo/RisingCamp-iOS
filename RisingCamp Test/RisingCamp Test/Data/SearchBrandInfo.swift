//
//  SearchBrandInfo.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/19.
//

import Foundation

struct SearchBrandInfo {
    let koName: String
    let enName: String
    let amount: Int
    let imageName: String
}

extension SearchBrandInfo {
    static let list = [
        SearchBrandInfo(koName: "엔비디아", enName: "NVIDIA", amount: 2377, imageName: "애플"),
        SearchBrandInfo(koName: "LG전자", enName: "LG", amount: 31796, imageName: "애플"),
        SearchBrandInfo(koName: "엔비디아3", enName: "NVIDIA3", amount: 2377, imageName: "애플"),
        SearchBrandInfo(koName: "엔비디아4", enName: "NVIDIA4", amount: 2377, imageName: "애플"),
        SearchBrandInfo(koName: "엔비디아5", enName: "NVIDIA5", amount: 2377, imageName: "애플"),
        SearchBrandInfo(koName: "엔비디아6", enName: "NVIDIA6", amount: 2377, imageName: "애플"),

    ]
    
}
