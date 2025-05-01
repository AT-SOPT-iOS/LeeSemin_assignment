//
//  ChannelCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/2/25.
//

import UIKit

import SnapKit
import Then

class ChannelCell: UICollectionViewCell {
    
    private let backgroundContainerView = UIView().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
    }
    
    private let logoImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(backgroundContainerView)
        backgroundContainerView.addSubview(logoImageView)
    }
    
    private func setLayout() {
        backgroundContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(12)
            $0.width.equalTo(90)
            $0.height.equalTo(45)
        }
        
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(68)
            $0.height.equalTo(34)
        }
    }
    
    func configure(_ content: ChannelContent) {
        logoImageView.image = content.logoImage
    }
}
