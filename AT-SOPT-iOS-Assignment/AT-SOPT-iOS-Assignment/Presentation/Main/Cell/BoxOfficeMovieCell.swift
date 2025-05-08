//
//  BoxOfficeMovieCell.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/8/25.
//

import UIKit

import SnapKit

final class BoxOfficeMovieCell: UITableViewCell {
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .medium(size: 25)
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
        [movieNameLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        movieNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(movieName: String) {
        movieNameLabel.text = movieName
    }
}
