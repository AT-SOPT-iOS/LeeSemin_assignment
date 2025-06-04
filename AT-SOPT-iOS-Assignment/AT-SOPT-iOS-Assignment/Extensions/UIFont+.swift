//
//  UIFont+.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/25/25.
//

import UIKit
import SwiftUI

enum FontName {
    static let regular = "Pretendard-Regular"
    static let medium = "Pretendard-Medium"
    static let semiBold = "Pretendard-SemiBold"
    static let bold = "Pretendard-Bold"
}

extension UIFont {
    
    static func regular(size: CGFloat) -> UIFont {
            return UIFont(name: FontName.regular, size: size) ?? .systemFont(ofSize: size)
        }
        
        static func medium(size: CGFloat) -> UIFont {
            return UIFont(name: FontName.medium, size: size) ?? .systemFont(ofSize: size)
        }
        
        static func semiBold(size: CGFloat) -> UIFont {
            return UIFont(name: FontName.semiBold, size: size) ?? .systemFont(ofSize: size)
        }
        
        static func bold(size: CGFloat) -> UIFont {
            return UIFont(name: FontName.bold, size: size) ?? .boldSystemFont(ofSize: size)
        }
}

extension Font {
    
    static func regular(size: CGFloat) -> Font {
        return .custom(FontName.regular, size: size)
    }
    
    static func medium(size: CGFloat) -> Font {
        return .custom(FontName.medium, size: size)
    }
    
    static func semiBold(size: CGFloat) -> Font {
        return .custom(FontName.semiBold, size: size)
    }
    
    static func bold(size: CGFloat) -> Font {
        return .custom(FontName.bold, size: size)
    }
}
