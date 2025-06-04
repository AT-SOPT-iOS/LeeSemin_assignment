//
//  MasterpieceCellView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct MasterpieceCellView: View {
    
    let content: MasterpieceContent
    
    var body: some View {
        Image(uiImage: content.posterImage)
            .resizable()
            .scaledToFill()
            .frame(width: 160, height: 90)
            .cornerRadius(3)
            .clipped()
    }
}
