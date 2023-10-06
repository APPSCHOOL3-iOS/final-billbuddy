//
//  TabView.swift
//  BillBuddy
//
//  Created by 윤지호 on 10/4/23.
//

import SwiftUI

struct BillBuddyTabView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack {
                tempRoomListView()
            }
            .tabItem { Text("list") }
            .tag(0)
            NavigationStack {
                ChattingView()
            }
            .tabItem { Text("Tab Label 1") }
            .tag(1)
            NavigationStack {
                MyPageView(user: User(email: "", name: "", phoneNum: "", bankName: "", bankAccountNum: "", isPremium: false, premiumDueDate: Date.now))
            }
            .tabItem { Text("MyPage") }
            .tag(2)
        }
    }
}

#Preview {
    BillBuddyTabView()
}