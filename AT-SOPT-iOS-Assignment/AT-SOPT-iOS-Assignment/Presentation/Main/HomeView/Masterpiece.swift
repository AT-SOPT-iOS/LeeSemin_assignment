//
//  Masterpiece.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/2/25.
//

import UIKit

import SnapKit

class Masterpiece: UIView {
    
    private var contentList = MasterpieceContent.masterpieceData
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "김가현PD의 인생작 TOP 5"
        label.textColor = .white
        label.font = .bold(size: 15)
        return label
    }()
    
    private let indicatorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        return stackView
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var currentPage: Int = 0 {
        didSet {
            updateIndicators()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setCollectionView()
        setDelegate()
        setIndicators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(titleLabel, indicatorStackView, collectionView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(8)
        }
        
        indicatorStackView.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(90)
        }
    }
    
    private func setCollectionView() {
        collectionView.register(MasterpieceCell.self, forCellWithReuseIdentifier: MasterpieceCell.identifier)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setIndicators() {
        indicatorStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for _ in 0..<contentList.count {
            let dot = UIView()
            dot.backgroundColor = .gray3
            dot.layer.cornerRadius = 2
            dot.snp.makeConstraints { $0.size.equalTo(4) }
            indicatorStackView.addArrangedSubview(dot)
        }
        
        updateIndicators()
    }
    
    private func updateIndicators() {
        for (index, view) in indicatorStackView.arrangedSubviews.enumerated() {
            view.backgroundColor = (index == currentPage) ? .white : .gray3
        }
    }
}

extension Masterpiece: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
    }
}

extension Masterpiece: UICollectionViewDataSource {
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
            withReuseIdentifier: MasterpieceCell.identifier,
            for: indexPath
        ) as? MasterpieceCell else {
            return UICollectionViewCell()
        }
        cell.configure(contentList[indexPath.row])
        return cell
    }
}

extension Masterpiece: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x <= 0 {
            currentPage = 0
        } else if scrollView.contentOffset.x >= scrollView.contentSize.width - scrollView.bounds.width {
            currentPage = contentList.count - 1
        } else {
            let center = CGPoint(x: collectionView.contentOffset.x + collectionView.bounds.size.width / 2, y: collectionView.bounds.size.height / 2)
            if let indexPath = collectionView.indexPathForItem(at: center) {
                currentPage = indexPath.item
            }
        }
    }
}
