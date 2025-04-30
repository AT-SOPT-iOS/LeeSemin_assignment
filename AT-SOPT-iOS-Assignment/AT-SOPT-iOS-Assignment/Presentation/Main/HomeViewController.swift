//
//  HomeViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 5/1/25.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let todaysTop20 = TodaysTop20()
    
    private let homeBannerView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .homeBanner
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
}

// MARK: - UI Setting

extension HomeViewController {
    private func setStyle() {
        self.view.backgroundColor = .black
        scrollView.showsVerticalScrollIndicator = false
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(homeBannerView, todaysTop20)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        homeBannerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        todaysTop20.snp.makeConstraints{
            $0.top.equalTo(homeBannerView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview()
        }
    }
}
