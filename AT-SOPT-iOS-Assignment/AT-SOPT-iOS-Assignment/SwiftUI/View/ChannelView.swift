//
//  ChannelView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct ChannelView: View {
    
    private let contentList = ChannelContent.channelData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(contentList) { content in
                    ChannelCellView(content: content)
                }
            }
            .padding(.horizontal, 8)
        }
        .padding(.top, 16)
    }
}
