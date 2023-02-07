//
//  Chat.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 2/5/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct Chat: Codable, Identifiable {
    
    @DocumentID var id: String?
    
    var numparticipants: Int
    
    var participantids: [String]
    
    var lastmsg: String?
    
    @ServerTimestamp var updated: Date?
    
    var msgs: [ChatMessage]?

}

struct ChatMessage: Codable, Identifiable {
    
    @DocumentID var id: String?
    
    var imageurl: String?
    
    @ServerTimestamp var timestamp: Date?
    
    var senderid: String
}
