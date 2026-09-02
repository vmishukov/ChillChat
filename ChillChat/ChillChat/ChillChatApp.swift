//
//  ChillChatApp.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 23.08.2026.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ChillChatApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @State var appStateManager = AppStateManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appStateManager.currentState {
                case .splash:
                    FakeSplashView()
                case .onboarding:
                    FakeSplashView()
                case .authentication:
                    RegistrationView()
                case .mainApp:
                    ChatMainTabView()
                }
            }
            .environment(appStateManager)
        }
    }
}
