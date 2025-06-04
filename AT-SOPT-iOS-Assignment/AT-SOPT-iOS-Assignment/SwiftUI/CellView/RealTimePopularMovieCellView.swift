//
//  RealTimePopularMovieCellView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct RealTimePopularMovieCellView: View {
    
    let content: RealTimePopularMovieContent
    
    var body: some View {
        Image(uiImage: content.posterImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 98, height: 146)
            .clipped()
            .cornerRadius(3)
    }
}
