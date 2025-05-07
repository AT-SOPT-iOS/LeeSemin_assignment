//
//  RealTimePopularLiveCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/1/25.
//

import UIKit

import SnapKit
import Then

class RealTimePopularLiveCell: UICollectionViewCell {
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 3
        $0.clipsToBounds = true
    }
    
    private let rankLabel = UILabel().then {
        $0.font = .semiBold(size: 19)
        $0.textColor = .white
        $0.transform = CGAffineTransform(rotationAngle: 0.15)
    }
    
    private let titleLabel = UILabel().then {
        $0.font = .medium(size: 10)
        $0.textColor = .white
    }
    
    private let episodeLabel = UILabel().then {
        $0.font = .regular(size: 10)
        $0.textColor = .gray2
    }
    
    private let ratingsLabel = UILabel().then {
        $0.font = .regular(size: 10)
        $0.textColor = .gray2
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
        addSubviews(posterImageView, rankLabel, titleLabel, episodeLabel, ratingsLabel)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        
        rankLabel.snp.makeConstraints {
            $0.top.equalTo(posterImageView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top).offset(2)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(4)
        }
        
        episodeLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(7)
        }
        
        ratingsLabel.snp.makeConstraints {
            $0.top.equalTo(episodeLabel.snp.bottom).offset(4)
            $0.leading.equalTo(rankLabel.snp.trailing).offset(7)
        }
    }
    
    func configure(_ content: RealTimePopularLiveContent) {
        posterImageView.image = content.posterImage
        rankLabel.text = "\(content.rank)"
        titleLabel.text = content.title
        episodeLabel.text = content.episode
        ratingsLabel.text = content.ratings
    }
}
