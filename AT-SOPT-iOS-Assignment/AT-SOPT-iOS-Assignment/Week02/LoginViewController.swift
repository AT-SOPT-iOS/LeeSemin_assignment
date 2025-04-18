//
//  LoginViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/15/25.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    var nickname: String?
    
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
        textField.setTextField(placeholder: "아이디")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.setTextField(placeholder: "비밀번호")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.gray2, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.layer.borderColor = UIColor(named: "gray4")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let findIdLabel: UILabel = {
        let label = UILabel()
        label.text = "아이디 찾기"
        label.textColor = .gray2
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let verticalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .gray4
        return view
    }()
    
    private let findPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호 찾기"
        label.textColor = .gray2
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.textColor = .gray3
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        let attributedTitle = NSAttributedString(
            string: "닉네임 만들러가기",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.gray2,
                .font: UIFont(name: "Pretendard-Regular", size: 14)
            ]
        )
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setTextFieldTargets()
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
            $0.height.equalTo(12)
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
    
    private func setTextFieldTargets() {
        [idTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidBeginEditing(_:)), for: .editingDidBegin)
            $0.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingDidEnd)
            $0.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        }
    }
    
    @objc private func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.gray2.cgColor
        textField.layer.borderWidth = 1
    }
    
    @objc private func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
    
    private func areTextFieldsValid() -> Bool {
        guard let idText = idTextField.text, !idText.isEmpty,
              let passwordText = passwordTextField.text, !passwordText.isEmpty else {
            return false
        }
        return true
    }
    
    @objc private func textFieldsDidChange() {
        if areTextFieldsValid() {
            loginButton.backgroundColor = .tvingRed
            loginButton.setTitleColor(.white, for: .normal)
        } else {
            loginButton.backgroundColor = .clear
            loginButton.setTitleColor(.gray2, for: .normal)
        }
    }
    
    @objc func loginButtonTapped() {
        if !areTextFieldsValid() {
            return
        }
        
        let welcomeVC = WelcomeViewController()
        welcomeVC.setLabelText(user: nickname ?? idTextField.text)
        
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    @objc private func signUpButtonTapped() {
        let inputNicknameVC = InputNicknameViewController()
        
        inputNicknameVC.nicknameCompletion = { [weak self] nickname in
            self?.nickname = nickname
        }
        
        inputNicknameVC.modalPresentationStyle = .pageSheet
        if let sheet = inputNicknameVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        present(inputNicknameVC, animated: true, completion: nil)
    }
}
