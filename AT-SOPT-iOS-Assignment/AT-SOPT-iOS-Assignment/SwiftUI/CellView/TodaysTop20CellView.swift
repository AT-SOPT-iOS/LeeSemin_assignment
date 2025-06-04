//
//  TodaysTop20CellView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct TodaysTop20CellView: View {
    
    let content: TodaysTop20Content
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text("\(content.rank)")
                .foregroundColor(.white)
                .font(.semiBold(size: 50))
                .rotationEffect(.degrees(8))
                .offset(y: 10)
            
            Image(uiImage: content.posterImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 98, height: 146)
                .cornerRadius(3)
                .clipped()
        }
    }
}
