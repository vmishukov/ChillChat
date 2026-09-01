//
//  AuthViewModel.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 23.08.2026.
//

import Foundation
import FirebaseAuth
import Combine

class AuthViewModel: ObservableObject {
    
    @Published var userID: String?
    
    init() {
        if let user = Auth.auth().currentUser {
            self.userID = user.uid
        } else {
            signInAnonymously()
        }
    }
    
    func signInAnonymously() {
        Task {
            do {
                let result = try await Auth.auth().signInAnonymously()
                userID = result.user.uid
            } catch {
                print(error.localizedDescription)
            }
          
        }

    }
    
}
