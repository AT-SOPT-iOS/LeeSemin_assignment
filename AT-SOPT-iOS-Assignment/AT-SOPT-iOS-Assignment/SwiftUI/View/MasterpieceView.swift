//
//  MasterpieceView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct MasterpieceView: View {
    
    private let contentList = MasterpieceContent.masterpieceData
    @State private var currentPage = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("김가현PD의 인생작 TOP 5")
                    .foregroundColor(.white)
                    .font(.bold(size: 15))
                
                Spacer()
                
                HStack(spacing: 4) {
                    ForEach(0..<contentList.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentPage ? Color.white : Color.gray)
                            .frame(width: 4, height: 4)
                    }
                }
            }
            .padding(.horizontal, 8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(contentList.indices, id: \.self) { index in
                        MasterpieceCellView(content: contentList[index])
                            .background(
                                GeometryReader { geo -> Color in
                                    let midX = geo.frame(in: .global).midX
                                    DispatchQueue.main.async {
                                        updateCurrentPage(midX: midX, index: index)
                                    }
                                    return Color.clear
                                }
                            )
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
    
    private func updateCurrentPage(midX: CGFloat, index: Int) {
        let screenCenterX = UIScreen.main.bounds.width / 2
        
        if abs(midX - screenCenterX) < 80 {
            if currentPage != index {
                currentPage = index
            }
        }
    }
}

#Preview {
    MainView()
}
