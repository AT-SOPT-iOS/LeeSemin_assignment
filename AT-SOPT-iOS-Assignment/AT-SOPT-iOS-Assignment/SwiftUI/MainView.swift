//
//  MainView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = 0
    private let tabTitles = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(.tvingLogo)
                    .resizable()
                    .frame(width: 191, height: 78)
                
                Spacer()
                
                HStack(spacing: 16) {
                    Image(.search)
                        .resizable()
                        .frame(width: 30, height: 30)
                    Image(.tvingIcon)
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.trailing, 20)
            }
            
            HStack(spacing: 16) {
                ForEach(0..<tabTitles.count, id: \.self) { index in
                    Button(action: {
                        selectedTab = index
                    }) {
                        VStack(spacing: 4) {
                            Text(tabTitles[index])
                                .foregroundColor(.white)
                                .font(.regular(size: 17))
                            if selectedTab == index {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 3.5)
                            } else {
                                Color.clear.frame(height: 3.5)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                TempTabView(title: "드라마")
                    .tag(1)
                TempTabView(title: "예능")
                    .tag(2)
                TempTabView(title: "영화")
                    .tag(3)
                TempTabView(title: "스포츠")
                    .tag(4)
                TempTabView(title: "뉴스")
                    .tag(5)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct TempTabView: View {
    let title: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.semiBold(size: 20))
                .foregroundColor(.white)
        }
        .background(Color.black)
    }
}
