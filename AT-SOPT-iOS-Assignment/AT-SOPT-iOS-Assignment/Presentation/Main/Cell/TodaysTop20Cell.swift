//
//  TodaysTop20Cell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/1/25.
//

import UIKit

import SnapKit
import Then

class TodaysTop20Cell: UICollectionViewCell {
    
    private let rankLabel = UILabel().then {
        $0.font = .semiBold(size: 50)
        $0.textColor = .white
        $0.transform = CGAffineTransform(rotationAngle: 0.15)
    }
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
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
        addSubviews(rankLabel, posterImageView)
    }
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.bottom.equalTo(posterImageView.snp.bottom)
            $0.leading.equalToSuperview().offset(8)
        }
        
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
    }
    
    func configure(_ content: TodaysTop20Content) {
        rankLabel.text = "\(content.rank)"
        posterImageView.image = content.posterImage
    }
}
