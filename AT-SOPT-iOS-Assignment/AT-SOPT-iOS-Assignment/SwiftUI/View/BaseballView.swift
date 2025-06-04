//
//  BaseballView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct BaseballView: View {
    
    private let contentList = BaseballContent.baseballData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 26) {
                ForEach(Array(contentList.enumerated()), id: \.element.id) { index, content in
                    BaseballCellView(content: content, index: index)
                }
            }
        }
        .padding(.top, 16)
    }
}
