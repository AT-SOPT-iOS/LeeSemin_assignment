//
//  RealTimePopularLiveCellView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct RealTimePopularLiveCellView: View {
    
    let content: RealTimePopularLiveContent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image(uiImage: content.posterImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 80)
                .clipped()
                .cornerRadius(3)
            
            HStack(alignment: .top, spacing: 4) {
                Text("\(content.rank)")
                    .font(.semiBold(size: 19))
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(8))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(content.title)
                        .font(.medium(size: 10))
                        .foregroundColor(.white)
                        .padding(.top, 2)
                    
                    Text(content.episode)
                        .font(.medium(size: 10))
                        .foregroundColor(Color(uiColor: .gray2))
                    
                    Text(content.ratings)
                        .font(.medium(size: 10))
                        .foregroundColor(Color(uiColor: .gray2))
                }
            }
            .padding(.leading, 8)
        }
    }
}
