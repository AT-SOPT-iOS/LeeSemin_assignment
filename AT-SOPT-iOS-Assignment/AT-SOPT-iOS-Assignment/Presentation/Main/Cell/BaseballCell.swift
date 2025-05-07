//
//  BaseballCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/2/25.
//

import UIKit

import SnapKit
import Then

class BaseballCell: UICollectionViewCell {
    
    private let backgroundContainerView = UIView()
    
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
            $0.leading.equalToSuperview()
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        
        logoImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(40)
        }
    }
    
    func configure(_ content: BaseballContent, index: Int) {
        logoImageView.image = content.logoImage
        backgroundContainerView.backgroundColor = index % 2 == 1 ? .clear : .white
    }
}
