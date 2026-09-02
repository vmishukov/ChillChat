//
//  RegistrationView.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 01.09.2026.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(AppStateManager.self) var appStateManager
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView{
                VStack {
                    Image(.heartBaloon)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    Text("Find your people")
                        .font(.custom(Fonts.soraSemiBold.rawValue, size: 30))
                        .foregroundStyle(Color(hex: "#f6b092"))
                    Text("create a free account and start connecting")
                        .font(.custom(Fonts.soraLight.rawValue, size: 16))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(hex: "#f6b092", opacity: 0.9))
                    HStack {
                        Text("already have an account?")
                            .font(.custom(Fonts.soraLight.rawValue, size: 14))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(Color(hex: "#f6b092", opacity: 0.9))
                            .padding(.bottom)
                        Button {
                            
                        } label: {
                            Text("sign in!")
                                .underline()
                                .font(.custom(Fonts.soraSemiBold.rawValue, size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundStyle(Color(hex: "#f6a192", opacity: 1))
                                .padding(.bottom)
                        }
                    }
                    .padding(.bottom)
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 2) {
                            textFieldSubtext(text: "NAME")
                            TextField("First name", text: $viewModel.name)
                                .modifier(RegistrationFieldModifier())
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            textFieldSubtext(text: "BIRTHDAY")
                            TextField("MM / DD / YYYY", text: $viewModel.birthday)
                                .modifier(RegistrationFieldModifier())
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        textFieldSubtext(text: "EMAIL")
                        TextField(text: $viewModel.email) {
                            Text(verbatim: "your@mail.com")
                        }
                        .modifier(RegistrationFieldModifier())
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        textFieldSubtext(text: "PASSWORD")
                        TextField("at least 8 characters", text: $viewModel.password)
                            .modifier(RegistrationFieldModifier())
                    }
                    
                    Button {
                        appStateManager.currentState = .mainApp
                    } label: {
                        Text("Create an account")
                            .foregroundStyle(.black.opacity(0.8))
                            .font(.custom(Fonts.soraRegular.rawValue, size: 22))
                            .frame(maxWidth: .greatestFiniteMagnitude)
                            .padding(.vertical)
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .continuous)
                                    .fill(Color(hex: "#f6b092"))
                                
                            )
                            .shadow(color: Color(hex: "#f6b092"), radius: 9)
                    }
                    .buttonStyle(.plain)
                    .padding(.top)
                    
                    HStack(alignment: .center) {
                        registrationLine
                        Text("or continue with")
                            .font(.custom(Fonts.soraLight.rawValue, size: 13))
                            .lineLimit(1)
                            .foregroundStyle(Color(hex: "#f6b092", opacity: 0.9))
                        registrationLine
                    }
                    .padding(.vertical)
                    VStack {
                        registrationContinueWithButton(method: .apple) {
                            
                        }
                        registrationContinueWithButton(method: .google) {
                            
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .frame(minHeight: geometry.size.height)
            }
        }
    }
    
    func textFieldSubtext(text: String) -> some View {
        Text(text)
            .font(.custom(Fonts.soraRegular.rawValue, size: 14))
            .foregroundColor(Color(hex: "#ffcfca"))
            .padding(.leading, 3)
    }
    
    var registrationLine: some View {
        RoundedRectangle(cornerRadius: 0, style: .continuous)
            .fill(
                RadialGradient(gradient: Gradient(colors: [.clear, Color(hex: "#f6b092", opacity: 1)]),
                               center: .center,
                               startRadius: 100,
                               endRadius: 10)
                
            )
            .frame(height: 1)
    }
    
    func registrationContinueWithButton(method: RegistrationMethods,
                                        action: @escaping () -> Void) -> some View {
        Button {
            
        } label: {
            HStack {
                method.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                Text("Continue with " +  method.title)
                    .foregroundStyle(.white.opacity(0.6))
                    .font(.custom(Fonts.soraRegular.rawValue, size: 18))
            }
            .frame(maxWidth: .greatestFiniteMagnitude)
            .padding(.vertical)
            
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color(hex: "#ffe4d5", opacity: 0.3))
                    .stroke(Color(hex: "#ffe4d5", opacity: 0.4), lineWidth: 2)
            )
            
        }
        .buttonStyle(.plain)
    }
}

struct RegistrationFieldModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .autocorrectionDisabled()
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color(hex: "#ffe4d5", opacity: 0.2))
                    .stroke(Color(hex: "#ffe4d5", opacity: 0.4), lineWidth: 2)
            )
            .font(.custom(Fonts.soraRegular.rawValue, size: 16))
    }
}

enum RegistrationMethods {
    case apple
    case google
    
    var title: String {
        
        switch self {
            
        case .apple:
            return "Apple"
        case .google:
            return "Google"
        }
    }
    
    var image: Image {
        
        switch self {
            
        case .apple:
            Image(systemName: "apple.logo")
        case .google:
            Image(.google)
        }
    }
}

#Preview {
    RegistrationView()
}
