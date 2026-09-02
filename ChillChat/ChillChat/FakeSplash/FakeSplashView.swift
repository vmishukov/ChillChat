//
//  FakeSplashView.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 31.08.2026.
//

import SwiftUI

struct FakeSplashView: View {
    
    @StateObject private var viewModel = FakeSplashViewModel()
    @Environment(AppStateManager.self) private var appStateManager
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.clear, Color(hex: "#f6d992", opacity: 0.5)]),
                                       center: .center,
                                       startRadius: 200,
                                       endRadius: 0)
                    )
                VStack {
                    Image(.heartBaloon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Text("Chill chat")
                        .font(.custom(Fonts.soraRegular.rawValue, size: 20))
                        .foregroundStyle(Color(hex: "f6a192"))
                    Text("Soft connections")
                        .font(.custom(Fonts.soraRegular.rawValue, size: 20))
                        .foregroundStyle(Color(hex: "fff1e0"))
                }
            }
        }
        .task {
            try? await Task.sleep(for: .seconds(3))
            appStateManager.currentState = .authentication
        }
    }
}

#Preview {
    FakeSplashView()
}
