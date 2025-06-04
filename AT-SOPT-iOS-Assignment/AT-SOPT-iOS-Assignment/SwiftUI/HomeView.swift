//
//  HomeView.swift
//  AT-SOPT-iOS-Assignment
//
//  Created by 이세민 on 6/3/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Image(.homeBanner)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 480)
                    .clipped()
                
                TodaysTop20View()
                RealTimePopularLiveView()
                RealTimePopularMovieView()
                BaseballView()
                ChannelView()
                MasterpieceView()
                
                FooterView()
            }
            .padding(.vertical, 12)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct FooterView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 8) {
                Text("공지")
                    .foregroundColor(Color(red: 140/255, green: 140/255, blue: 140/255))
                    .font(.medium(size: 11))
                    .padding([.top, .bottom, .leading], 16)
                
                Text("티빙 계정 공유 정책 추가 안내")
                    .foregroundColor(Color(red: 217/255, green: 217/255, blue: 217/255))
                    .font(.medium(size: 11))
                
                Spacer()
                
                Image(.forward)
                    .resizable()
                    .frame(width: 18, height: 18)
                    .padding(.trailing, 12)
            }
            .background(Color(red: 33/255, green: 33/255, blue: 33/255))
            .cornerRadius(5)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            
            Text("고객문의 • 이용약관 • 개인정보처리방침\n사업자정보 • 인재채용")
                .font(.medium(size: 11))
                .foregroundColor(Color(red: 140/255, green: 140/255, blue: 140/255))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 16)
        }
    }
}
