//
//  WelcomeViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/16/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let tvingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .tving
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "ㅋㅋ 님\n반가워요!"
        label.textColor = .gray1
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 23)
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        button.backgroundColor = .tvingRed
        button.layer.cornerRadius = 3
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
        view.addSubviews(tvingImageView, welcomeLabel, mainButton)
    }
    
    private func setLayout(){
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
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
