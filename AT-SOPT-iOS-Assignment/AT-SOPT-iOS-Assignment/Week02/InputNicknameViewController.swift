//
//  InputNicknameViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/19/25.
//

import UIKit

class InputNicknameViewController: UIViewController {
    
    var nicknameCompletion: ((String) -> Void)?
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.textColor = .black
        label.font = UIFont(name: "Pretendard-Medium", size: 23)
        return label
    }()
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .gray2
        textField.textColor = .gray4
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.layer.cornerRadius = 3
        textField.clipsToBounds = true
        textField.setLeftPadding(25)
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.backgroundColor = .tvingRed
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
}

// MARK: - UI Setting

extension InputNicknameViewController {
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(descriptionLabel, nicknameTextField, saveButton)
    }
    
    private func setLayout() {
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.leading.equalToSuperview().offset(30)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(332)
            $0.height.equalTo(52)
        }
    }
}

// MARK: - Button Action

extension InputNicknameViewController {
    @objc private func saveButtonTapped() {
        guard let nickname = nicknameTextField.text, !nickname.isEmpty else { return }
        nicknameCompletion?(nickname)
        dismiss(animated: true)
    }
}
