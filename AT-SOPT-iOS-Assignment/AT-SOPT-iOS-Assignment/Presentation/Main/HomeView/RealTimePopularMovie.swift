//
//  RealTimePopularMovie.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/1/25.
//

import UIKit

import SnapKit

class RealTimePopularMovie: UIView {
    
    private var contentList = RealTimePopularMovieContent.realTimePopularMovieData
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "실시간 인기 영화"
        label.textColor = .white
        label.font = .bold(size: 15)
        return label
    }()
    
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "더보기"
        label.textColor = .gray2
        label.font = .medium(size: 12)
        return label
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setCollectionView()
        setDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(titleLabel, moreLabel, collectionView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        
        moreLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(160)
        }
    }
    
    private func setCollectionView() {
        collectionView.register(RealTimePopularMovieCell.self, forCellWithReuseIdentifier: RealTimePopularMovieCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension RealTimePopularMovie: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}

extension RealTimePopularMovie: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return contentList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RealTimePopularMovieCell.identifier,
            for: indexPath
        ) as? RealTimePopularMovieCell else {
            return UICollectionViewCell()
        }
        cell.configure(contentList[indexPath.row])
        return cell
    }
}
