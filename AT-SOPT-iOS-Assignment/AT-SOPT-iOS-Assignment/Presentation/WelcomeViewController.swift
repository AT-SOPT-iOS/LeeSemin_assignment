//
//  WelcomeViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/16/25.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    
    private var user: String?
    
    private let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .tving
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray1
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .bold(size: 23)
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .semiBold(size: 14)
        button.backgroundColor = .tvingRed
        button.layer.cornerRadius = 3
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        bindID()
    }
}

// MARK: - UI Setting

extension WelcomeViewController {
    private func setStyle() {
        self.view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubviews(tvingImageView, welcomeLabel, mainButton)
    }
    
    private func setLayout() {
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.width.equalToSuperview()
            $0.height.equalTo(210)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(tvingImageView.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(52)
        }
    }
}

// MARK: - Data Binding

extension WelcomeViewController {
    func setLabelText(user: String?) {
        self.user = user
    }
    
    private func bindID() {
        if let user = user {
            self.welcomeLabel.text = "\(user) 님\n반가워요!"
        }
    }
}
