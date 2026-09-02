//
//  ChatMainView.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 02.09.2026.
//

import SwiftUI

struct ChatMainTabView: View {
    
    @State private var selectedTab: Tabs = .messages
    
    enum Tabs {
        case dating
        case messages
        case profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DatingView()
                .tabItem {
                    Label("Dating", systemImage: "person.3")
                }
                .tag(Tabs.dating)
            ChatView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }
                .tag(Tabs.messages)
            ProfileVIew()
                .tabItem {
                    Label("Messages", systemImage: "person.crop.circle")
                }
                .tag(Tabs.profile)
        }
    }
}

#Preview {
    ChatMainTabView()
}
