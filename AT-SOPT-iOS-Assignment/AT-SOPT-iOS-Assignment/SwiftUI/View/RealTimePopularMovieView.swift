//
//  RealTimePopularMovieView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct RealTimePopularMovieView: View {
    
    let contentList = RealTimePopularMovieContent.realTimePopularMovieData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("실시간 인기 영화")
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
                    ForEach(contentList, id: \.id) { content in
                        RealTimePopularMovieCellView(content: content)
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}
