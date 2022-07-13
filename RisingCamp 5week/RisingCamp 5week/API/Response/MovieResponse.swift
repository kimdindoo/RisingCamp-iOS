//
//  MovieResponse.swift
//  RisingCamp 5week
//
//  Created by 김진수 on 2022/07/12.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Decodable {
    var boxOfficeResult: BoxOfficeResult?
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Decodable {
    var boxofficeType, showRange: String?
    var dailyBoxOfficeList: [DailyBoxOfficeList]?
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Decodable {
    var rnum, rank, rankInten: String?
    var rankOldAndNew: RankOldAndNew?
    var movieCD, movieNm, openDt, salesAmt: String?
    var salesShare, salesInten, salesChange, salesAcc: String?
    var audiCnt, audiInten, audiChange, audiAcc: String?
    var scrnCnt, showCnt: String?

//    enum CodingKeys: Decodable, CodingKey {
//        case rnum, rank, rankInten, rankOldAndNew
//        case movieCD = "movieCd"
//        case movieNm, openDt, salesAmt, salesShare, salesInten, salesChange, salesAcc, audiCnt, audiInten, audiChange, audiAcc, scrnCnt, showCnt
//    }
}

enum RankOldAndNew: String, Decodable {
    case old = "OLD"
}
