//
//  messageBubble.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 23.08.2026.
//

import SwiftUI

struct MessageBubble: View {
    let message: MessageModel
    let isMe: Bool
    var body: some View {
        HStack {
            if isMe { Spacer() }
            Text(message.text)
                .padding()
                .background(isMe ? Color.blue : Color.green)
                .foregroundStyle(.white)
                .cornerRadius(12)
            if !isMe { Spacer() }
        }
        .padding(.horizontal)
    }
}

#Preview {
    MessageBubble(message: MessageModel(id: "",
                                        text: "",
                                        senderID: "",
                                        timeStamp: Date()),
                  isMe: true)
}
