//
//  LoginViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/15/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "TVING ID 로그인"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        textField.backgroundColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        textField.setLeftPadding(25)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 15)
        textField.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        textField.backgroundColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        textField.setLeftPadding(25)
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1).cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let findIdLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let verticalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 46/255, green: 46/255, blue: 46/255, alpha: 1)
        return view
    }()
    
    private let findPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.textColor = UIColor(red: 156/255, green: 156/255, blue: 156/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = UIColor(red: 98/255, green: 98/255, blue: 98/255, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        let title = "닉네임 만들러가기"
        let attributedTitle = NSAttributedString(
            string: title,
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.white,
                .font: UIFont(name: "Pretendard-Regular", size: 14)
            ]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI() {
        view.addSubviews(
            titleLabel,
            idTextField,
            passwordTextField,
            loginButton,
            findIdLabel,
            verticalLine,
            findPasswordLabel,
            questionLabel,
            signUpButton
        )
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(25)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        findIdLabel.snp.makeConstraints {
            $0.trailing.equalTo(verticalLine.snp.leading).offset(-40)
            $0.centerY.equalTo(verticalLine)
        }
        
        verticalLine.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(1)
            $0.height.equalTo(24)
        }
        
        findPasswordLabel.snp.makeConstraints {
            $0.leading.equalTo(verticalLine.snp.trailing).offset(40)
            $0.centerY.equalTo(verticalLine)
        }
        
        questionLabel.snp.makeConstraints{
            $0.top.equalTo(findIdLabel.snp.bottom).offset(30)
            $0.centerX.equalTo(findIdLabel)
        }
        
        signUpButton.snp.makeConstraints {
            $0.leading.equalTo(questionLabel.snp.trailing).offset(40)
            $0.centerY.equalTo(questionLabel)
        }
    }
}
