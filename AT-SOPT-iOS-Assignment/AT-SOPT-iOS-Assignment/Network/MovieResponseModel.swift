//
//  MovieResponseModel.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import Foundation

struct MovieResponseWrapper: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let boxofficeType: String
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Codable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: String
    let movieCd: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String
}
