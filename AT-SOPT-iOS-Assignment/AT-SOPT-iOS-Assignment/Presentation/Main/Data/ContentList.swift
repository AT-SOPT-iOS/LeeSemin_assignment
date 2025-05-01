//
//  ContentList.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/1/25.
//

import UIKit

struct TodaysTop20Content {
    let rank: Int
    let posterImage: UIImage
}

struct RealTimePopularLiveContent {
    let posterImage: UIImage
    let rank: Int
    let title: String
    let episode: String
    let ratings: String
}

struct RealTimePopularMovieContent {
    let posterImage: UIImage
}

struct BaseballContent {
    let logoImage: UIImage
}

struct ChannelContent {
    let logoImage: UIImage
}

struct MasterpieceContent {
    let posterImage: UIImage
}

extension TodaysTop20Content {
    static let todaysTop20Data: [TodaysTop20Content] = [
        TodaysTop20Content(rank: 1, posterImage: .signal),
        TodaysTop20Content(rank: 2, posterImage: .harryPotter),
        TodaysTop20Content(rank: 3, posterImage: .theLordOfTheRings),
        TodaysTop20Content(rank: 4, posterImage: .suzume)
    ]
}

extension RealTimePopularLiveContent {
    static let realTimePopularLiveData: [RealTimePopularLiveContent] = [
        RealTimePopularLiveContent(posterImage: .exchange, rank: 1, title: "환승연애", episode: "1화", ratings: "9.8%"),
        RealTimePopularLiveContent(posterImage: .whenTheStarsGossip, rank: 2, title: "별들에게 물어봐", episode: "4화", ratings: "1.1%"),
        RealTimePopularLiveContent(posterImage: .lovelyRunner, rank: 3, title: "선재 업고 튀어", episode: "5화", ratings: "5.6%"),
        RealTimePopularLiveContent(posterImage: .earthArcade, rank: 4, title: "뿅뿅 지구오락실", episode: "2화", ratings: "7.5%"),
        RealTimePopularLiveContent(posterImage: .residentPlaybook, rank: 5, title: "언젠가는 슬기로울 전공의생활", episode: "1화", ratings: "3.5%"),
        RealTimePopularLiveContent(posterImage: .theDivorceInsurance, rank: 6, title: "이혼보험", episode: "8화", ratings: "2.9%")
    ]
}

extension RealTimePopularMovieContent {
    static let realTimePopularMovieData: [RealTimePopularMovieContent] = [
        RealTimePopularMovieContent(posterImage: .greenBeanRedBean),
        RealTimePopularMovieContent(posterImage: .imSolo),
        RealTimePopularMovieContent(posterImage: .refrigerator),
        RealTimePopularMovieContent(posterImage: .heartSignal),
        RealTimePopularMovieContent(posterImage: .cleanSweep),
        RealTimePopularMovieContent(posterImage: .fromMeToYou)
    ]
}

extension BaseballContent {
    static let baseballData: [BaseballContent] = [
        BaseballContent(logoImage: .dusan),
        BaseballContent(logoImage: .kia),
        BaseballContent(logoImage: .lg),
        BaseballContent(logoImage: .samsung),
        BaseballContent(logoImage: .ssg),
        BaseballContent(logoImage: .lotte),
        BaseballContent(logoImage: .hanhwa),
        BaseballContent(logoImage: .kiwoom),
        BaseballContent(logoImage: .kt),
        BaseballContent(logoImage: .nc)
    ]
}

extension ChannelContent {
    static let channelData: [ChannelContent] = [
        ChannelContent(logoImage: .appletv),
        ChannelContent(logoImage: .kbo),
        ChannelContent(logoImage: .kbl),
        ChannelContent(logoImage: .afc)
    ]
}

extension MasterpieceContent {
    static let masterpieceData: [MasterpieceContent] = [
        MasterpieceContent(posterImage: .mrSunshine),
        MasterpieceContent(posterImage: .thatsLove),
        MasterpieceContent(posterImage: .moving),
        MasterpieceContent(posterImage: .discoveryOfLove),
        MasterpieceContent(posterImage: .descendantsOfTheSun)
    ]
}
