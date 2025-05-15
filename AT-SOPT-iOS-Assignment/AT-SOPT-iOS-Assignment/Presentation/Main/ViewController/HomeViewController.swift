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
    private let realTimePopularLive = RealTimePopularLive()
    private let realTimePopularMovie = RealTimePopularMovie()
    private let baseball = Baseball()
    private let channel = Channel()
    private let masterpiece = Masterpiece()
    
    private let homeBannerView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .homeBanner
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let footerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "공지"
        label.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1)
        label.font = .medium(size: 11)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 계정 공유 정책 추가 안내"
        label.textColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        label.font = .medium(size: 11)
        return label
    }()
    
    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .forward
        return imageView
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        let text = "고객문의 • 이용약관 • 개인정보처리방침\n사업자정보 • 인재채용"
        let attributedText = NSMutableAttributedString(string: text, attributes: [
            .foregroundColor: UIColor(white: 140/255, alpha: 1)
        ])
        
        if let range = text.range(of: "개인정보처리방침") {
            attributedText.addAttribute(.foregroundColor, value: UIColor(white: 217/255, alpha: 1), range: NSRange(range, in: text))
        }
        
        label.attributedText = attributedText
        label.font = .medium(size: 11)
        label.numberOfLines = 0
        return label
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
        
        contentView.addSubviews(
            homeBannerView,
            todaysTop20,
            realTimePopularLive,
            realTimePopularMovie,
            baseball,
            channel,
            masterpiece,
            footerContainerView,
            footerLabel
        )
        
        footerContainerView.addSubviews(noticeLabel, descriptionLabel, arrowImageView)
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
            $0.height.equalTo(480)
        }
        
        todaysTop20.snp.makeConstraints{
            $0.top.equalTo(homeBannerView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        realTimePopularLive.snp.makeConstraints{
            $0.top.equalTo(todaysTop20.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        realTimePopularMovie.snp.makeConstraints {
            $0.top.equalTo(realTimePopularLive.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        baseball.snp.makeConstraints {
            $0.top.equalTo(realTimePopularMovie.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        channel.snp.makeConstraints {
            $0.top.equalTo(baseball.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(90)
        }
        
        masterpiece.snp.makeConstraints {
            $0.top.equalTo(channel.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }
        
        footerContainerView.snp.makeConstraints {
            $0.top.equalTo(masterpiece.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(347)
            $0.height.equalTo(50)
        }
        
        noticeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.size.equalTo(18)
        }
        
        footerLabel.snp.makeConstraints {
            $0.top.equalTo(footerContainerView.snp.bottom).offset(16)
            $0.leading.equalTo(footerContainerView.snp.leading)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}
