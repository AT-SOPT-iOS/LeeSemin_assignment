//
//  Config.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/9/25.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let KEY = "KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found !!!")
        }
        return dict
    }()
}

extension Config {
    static let key: String = {
        guard let key = Config.infoDictionary[Keys.Plist.KEY] as? String else {
            fatalError("🍞⛔️BASE_URL is not set in plist for this configuration⛔️🍞")
        }
        return key
    }()
}
