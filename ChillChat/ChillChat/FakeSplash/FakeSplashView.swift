//
//  FakeSplashView.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 31.08.2026.
//

import SwiftUI

struct FakeSplashView: View {
    
    @StateObject private var viewModel = FakeSplashViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(gradient: Gradient(colors: [.clear, Color(hex: "#f6b092", opacity: 1)]),
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
                    Text("Soft connections")
                        .font(.custom(Fonts.soraRegular.rawValue, size: 16))
                }
            }
        }
    }
    
}

#Preview {
    FakeSplashView()
}
