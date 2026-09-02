//
//  AppStateManager.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 02.09.2026.
//

import SwiftUI

enum AppState {
    case splash
    case onboarding
    case authentication
    case mainApp
}

@Observable
final class AppStateManager {
    var currentState: AppState = .splash
}
