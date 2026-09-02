//
//  RegistrationViewModel.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 01.09.2026.
//

import Foundation
import Combine
import DeveloperToolsSupport


final class RegistrationViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var birthday: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
}
