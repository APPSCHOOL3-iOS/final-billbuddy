//
//  TabView.swift
//  BillBuddy
//
//  Created by 윤지호 on 10/4/23.
//

import SwiftUI
import UIKit

struct BillBuddyTabView: View {
    @State private var selectedTab = 0
    @State private var isShowingAdScreen: Bool = false

    @StateObject private var floatingButtonMenuStore = FloatingButtonMenuStore()
    @EnvironmentObject private var userService: UserService

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray500)
        UITabBarItem.appearance().setTitleTextAttributes([.font:UIFont(name: "Pretendard-Bold", size: 10)!], for: .normal)
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                TravelListView(floatingButtonMenuStore: floatingButtonMenuStore)
                if let isPremium = userService.currentUser?.isPremium {
                    if isPremium == false {
                        BannerView().frame(height: 65)
                            .overlay(
                                Rectangle()
                                    .fill(Color.systemBlack.opacity(floatingButtonMenuStore.isDimmedBackground ? 0.5 : 0)).edgesIgnoringSafeArea(.all)
                            )
                            .padding(.top, -8)
                    }
                }
            }
            .tabItem {
                Image(.hometap)
                    .renderingMode(.template)
                Text("홈")
            }
//            .brightness(isDimmedBackground ? -0.5 : 0)
            .toolbarBackground(Color.systemBlack.opacity(floatingButtonMenuStore.isDimmedBackground ? 0.5 : 0), for: .tabBar)
            .fullScreenCover(isPresented: $isShowingAdScreen, content: {
                NativeContentView(isShowingAdScreen: $isShowingAdScreen)
            })
            .onAppear {
                if let isPremium = userService.currentUser?.isPremium {
                    if !isPremium {
                        isShowingAdScreen = Bool.random()
                    } else {
                        isShowingAdScreen = false
                    }
                }
            }
            .tag(0)
            
            NavigationStack {
                ChattingView()
                if let isPremium = userService.currentUser?.isPremium {
                    if isPremium == false {
                        BannerView().frame(height: 60)
                            .padding(.top, -8)
                    }
                }
            }
            .tabItem {
                Image(.chattap)
                    .renderingMode(.template)
                Text("채팅")
            }
            .fullScreenCover(isPresented: $isShowingAdScreen, content: {
                NativeContentView(isShowingAdScreen: $isShowingAdScreen)
            })
            .onAppear {
                if let isPremium = userService.currentUser?.isPremium {
                    if !isPremium {
                        isShowingAdScreen = Bool.random()
                    } else {
                        isShowingAdScreen = false
                    }
                }
            }
            .tag(1)
            
            NavigationStack {
                MyPageView()
                if let isPremium = userService.currentUser?.isPremium {
                    if isPremium == false {
                        BannerView().frame(height: 60)
                            .padding(.top, -8)
                    }
                }
            }
            .tabItem {
                Image(.mypagetap)
                    .renderingMode(.template)
                Text("마이페이지")
            }
            .fullScreenCover(isPresented: $isShowingAdScreen, content: {
                NativeContentView(isShowingAdScreen: $isShowingAdScreen)
            })
            .onAppear {
                if let isPremium = userService.currentUser?.isPremium {
                    if !isPremium {
                        isShowingAdScreen = Bool.random()
                    } else {
                        isShowingAdScreen = false
                    }
                }
            }
            .tag(2)
        }
        .accentColor(.systemBlack)
    }
}

#Preview {
    BillBuddyTabView()
}
