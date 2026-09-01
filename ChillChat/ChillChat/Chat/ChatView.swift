//
//  ContentView.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 23.08.2026.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var chatVM = ChatViewModel()
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(chatVM.messages) { message in
                        MessageBubble(message: message,
                                      isMe: message.senderID == authVM.userID)
                    }
                }
            }
                
            HStack {
                TextField("Message...",
                          text: $messageText)
                .textFieldStyle(.roundedBorder)
                Button("Send") {
                    chatVM.sendMessage(text: messageText,
                                       senderID: authVM.userID!)
                    messageText = ""
                }
                .disabled(authVM.userID == nil || messageText.isEmpty)
            }
        }
        .padding()
        .task {
            if authVM.userID != nil {
                chatVM.startListening()
            }
        }
        .onChange(of: authVM.userID) { uuid, _ in
            if uuid == nil {
                chatVM.startListening()
            }
        }
        
    }
}

#Preview {
    ChatView()
}
