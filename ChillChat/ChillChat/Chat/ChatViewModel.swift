//
//  ChatViewModel.swift
//  ChillChat
//
//  Created by Vladislav Mishukov on 23.08.2026.
//

import Foundation
import FirebaseFirestore
import Combine

final class ChatViewModel: ObservableObject {
    
    @Published var messages: [MessageModel] = []
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    init() { }
    
    func sendMessage(text: String, senderID: String) {
        db.collection("messages").addDocument(data: [
            "text": text,
            "senderID": senderID,
            "timestamp": Timestamp(date: Date())
        ])
    }
    
    func startListening() {
        guard listener == nil else { return }
        listener = db.collection("messages")
            .order(by: "timestamp")
            .addSnapshotListener { snaphot, _ in
                guard let documents = snaphot?.documents else { return }
                let messages: [MessageModel] = documents.map { doc in
                    let data = doc.data()
                    
                    return MessageModel(id: doc.documentID,
                                        text: data["text"] as? String ?? "",
                                        senderID: data["senderID"] as? String ?? "",
                                        timeStamp: (data["timestamp"] as? Timestamp)?.dateValue() ?? Date())
                }
                
                DispatchQueue.main.async { [weak self] in
                    self?.messages = messages
                }
            }
    }
    
}

private extension ChatViewModel {
    
}
