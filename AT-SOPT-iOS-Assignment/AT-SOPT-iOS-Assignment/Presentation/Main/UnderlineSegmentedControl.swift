//
//  UnderlineSegmentedControl.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 4/30/25.
//

import UIKit
import SnapKit

class UnderlineSegmentedControl: UISegmentedControl {
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(items: [Any]?) {
        super.init(items: items)
        
        setStyle()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.regular(size: 17)
        ]
        setTitleTextAttributes(titleAttributes, for: .normal)
        setTitleTextAttributes(titleAttributes, for: .selected)
    }
    
    private func setUI() {
        addSubview(underLineView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let title = titleForSegment(at: selectedSegmentIndex) else { return }
        
        let textWidth = (title as NSString).size(withAttributes: titleTextAttributes(for: .selected)).width
        let segmentWidth = bounds.width / CGFloat(numberOfSegments)
        let underlineX = (CGFloat(selectedSegmentIndex) * segmentWidth) + (segmentWidth - textWidth) / 2
        
        UIView.animate(withDuration: 0.2) {
            self.underLineView.snp.remakeConstraints {
                $0.left.equalToSuperview().offset(underlineX)
                $0.bottom.equalToSuperview()
                $0.width.equalTo(textWidth)
                $0.height.equalTo(3.5)
            }
            
            self.layoutIfNeeded()
        }
    }
}
