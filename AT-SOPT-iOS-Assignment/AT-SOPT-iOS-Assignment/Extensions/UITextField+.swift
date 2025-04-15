//
//  UITextField+.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/15/25.
//

import UIKit

extension UITextField {
    func setTextField(placeholder: String) {
        self.placeholder = placeholder
        self.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        self.textColor = .gray2
        self.backgroundColor = .gray4
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        self.setLeftPadding(25)
    }
    
    func setLeftPadding(_ width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
