//
//  MasterpieceCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/2/25.
//

import UIKit

import SnapKit
import Then

class MasterpieceCell: UICollectionViewCell {
    
    private let posterImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
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
        addSubviews(posterImageView)
    }
    
    private func setLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(160)
            $0.height.equalTo(90)
        }
    }
    
    func configure(_ content: MasterpieceContent) {
        posterImageView.image = content.posterImage
    }
}
