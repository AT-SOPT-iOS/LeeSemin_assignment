//
//  TodaysTop20View.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct TodaysTop20View: View {
    
    let contentList = TodaysTop20Content.todaysTop20Data
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("오늘의 티빙 TOP 20")
                .foregroundColor(.white)
                .font(.bold(size: 15))
                .padding(.leading, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(contentList, id: \.rank) { content in
                        TodaysTop20CellView(content: content)
                    }
                }
            }
        }
    }
}
