//
//  ChannelCellView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct ChannelCellView: View {
    
    let content: ChannelContent
    
    var body: some View {
        Image(uiImage: content.logoImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 90, height: 45)
    }
}
