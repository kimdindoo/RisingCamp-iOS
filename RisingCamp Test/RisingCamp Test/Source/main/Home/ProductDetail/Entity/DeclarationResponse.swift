//
//  DeclarationResponse.swift
//  RisingCamp Test
//
//  Created by 김진수 on 2022/07/28.
//

import Foundation

struct DeclarationResponse: Decodable {
    
    let isSuccess: Bool
    let code: Int
    let messeage: String
    
}
