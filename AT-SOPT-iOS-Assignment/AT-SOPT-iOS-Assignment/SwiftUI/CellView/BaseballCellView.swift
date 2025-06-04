//
//  BaseballCellView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct BaseballCellView: View {
    
    let content: BaseballContent
    let index: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(index % 2 == 0 ? Color.white : Color.clear)
                .frame(width: 80, height: 50)
            
            Image(uiImage: content.logoImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
        }
    }
}
