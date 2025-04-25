//
//  String+.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/25/25.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let regularExpression = "^[A-Z0-9a-z._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
    
    var isKorean: Bool {
        let regularExpression = "^[가-힣ㄱ-ㅎㅏ-ㅣ]{2,8}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return predicate.evaluate(with: self)
    }
}
