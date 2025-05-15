//
//  BoxOfficeMovieCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import UIKit

import SnapKit

final class BoxOfficeMovieCell: UITableViewCell {
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .semiBold(size: 35)
        label.transform = CGAffineTransform(rotationAngle: 0.15)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .semiBold(size: 18)
        return label
    }()
    
    private let openDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .semiBold(size: 15)
        return label
    }()
    
    private let totalAudienceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .semiBold(size: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.selectionStyle = .none
        self.backgroundColor = .black
    }
    
    private func setUI() {
        addSubviews(rankLabel, nameLabel, openDateLabel, totalAudienceLabel)
    }
    
    private func setLayout() {
        rankLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(rankLabel.snp.top)
            $0.leading.equalToSuperview().offset(100)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(100)
        }
        
        totalAudienceLabel.snp.makeConstraints {
            $0.top.equalTo(openDateLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().offset(100)
        }
    }
    
    func configure(rank: String, name: String, openDate: String, totalAudience: String) {
        rankLabel.text = rank
        nameLabel.text = name
        openDateLabel.text = "개봉일: \(openDate)"
        totalAudienceLabel.text = "누적 관객수: \(totalAudience.formattedWithDecimalSeparator())명"
    }
}
