//
//  MessageModel.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 23.08.2026.
//

import Foundation

struct MessageModel: Identifiable {
    
    let id: String
    let text: String
    let senderID: String
    let timeStamp: Date
}
