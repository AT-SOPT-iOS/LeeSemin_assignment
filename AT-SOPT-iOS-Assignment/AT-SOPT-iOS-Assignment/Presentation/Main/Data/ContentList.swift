//
//  ContentList.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/1/25.
//

import UIKit

struct ContentList {
    let rank: Int
    let logoImage: UIImage
}

extension ContentList {
    static let todaysTop20Data: [ContentList] = [
        ContentList(rank: 1, logoImage: .signal),
        ContentList(rank: 2, logoImage: .harryPotter),
        ContentList(rank: 3, logoImage: .theLordOfTheRings),
        ContentList(rank: 4, logoImage: .suzume)
    ]
}
