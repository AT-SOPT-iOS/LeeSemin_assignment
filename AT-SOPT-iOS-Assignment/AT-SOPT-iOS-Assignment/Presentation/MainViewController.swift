//
//  MainViewController.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/30/25.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let tabTitles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    private let tvingLogoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .tvingLogo
        return imageView
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    private let searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .search
        return imageView
    }()
    
    private let tvingIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = .tvingIcon
        return imageView
    }()
    
    private lazy var segmentController: UISegmentedControl = {
        let segment = UnderlineSegmentedControl(items: tabTitles)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    private lazy var pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var viewControllers: [UIViewController] = tabTitles.map { createTempViewController(title: $0) }
    
    private func createTempViewController(title: String) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = .black
        
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.textColor = .white
        
        vc.view.addSubview(label)
        label.snp.makeConstraints { $0.center.equalToSuperview() }
        
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setInitialViewController()
        setDelegates()
    }
}

// MARK: - UI Setting

extension MainViewController {
    private func setStyle() {
        self.view.backgroundColor = .black
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        headerStackView.addArrangedSubview(searchImageView)
        headerStackView.addArrangedSubview(tvingIconImageView)
        
        contentView.addSubviews(tvingLogoImageView, headerStackView, segmentController, pageViewController.view)
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
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
        
        tvingLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(191)
            $0.height.equalTo(78)
        }
        
        headerStackView.snp.makeConstraints {
            $0.centerY.equalTo(tvingLogoImageView)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        [searchImageView, tvingIconImageView].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(30)
            }
        }
        
        segmentController.snp.makeConstraints {
            $0.top.equalTo(tvingLogoImageView.snp.bottom)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(segmentController.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setInitialViewController() {
        if let firstVC = viewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    private func setDelegates() {
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
}

extension MainViewController {
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let direction: UIPageViewController.NavigationDirection = index > (pageViewController.viewControllers?.first.flatMap { viewControllers.firstIndex(of: $0) } ?? 0) ? .forward : .reverse
        
        pageViewController.setViewControllers([viewControllers[index]], direction: direction, animated: true)
    }
}

extension MainViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        return viewControllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else { return nil }
        return viewControllers[index + 1]
    }
}

extension MainViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = viewControllers.firstIndex(of: currentVC) else { return }
        
        segmentController.selectedSegmentIndex = index
    }
}
