//
//  RealTimePopularLiveView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct RealTimePopularLiveView: View {
    
    let contentList = RealTimePopularLiveContent.realTimePopularLiveData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.bold(size: 15))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("더보기")
                    .font(.medium(size: 12))
                    .foregroundColor(Color(uiColor: .gray2))
            }
            .padding(.horizontal, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(contentList, id: \.rank) { content in
                        RealTimePopularLiveCellView(content: content)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}
