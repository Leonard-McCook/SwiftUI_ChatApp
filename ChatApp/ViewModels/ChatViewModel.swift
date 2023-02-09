//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 2/7/23.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    
    @Published var chats = [Chat]()
    
    var databaseService = DatabaseService()
    
    init() {
        
        // Retrieve chats when ChatViewModel is created
        getChats()
    }
    
    func getChats() {
        
        // Use the database service to retrieve the chats
        databaseService.getAllChats { chats in
            
            // Set the retrieved data to the chat's property
            self.chats = chats
        }
       
    }
    
}
