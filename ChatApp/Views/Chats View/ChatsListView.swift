//
//  ChatsListView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/20/23.
//

import SwiftUI

struct ChatsListView: View {
    
    @EnvironmentObject var chatViewModel: ChatViewModel
    
    @Binding var isChatShowing: Bool
    
    var body: some View {
        
        if chatViewModel.chats.count > 0 {
            
            List(chatViewModel.chats) { chat in
                
                Button {
                    
                    // Set selcted chat for the chatviewmodel
                    chatViewModel.selectedChat = chat
                    
                    // display conversation view
                    isChatShowing = true
                    
                } label: {
                    Text(chat.id ?? "empty chat id")
                }

                
                
                
            }
            
        }
        else {
            Text("No chats")
        }
        
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsListView(isChatShowing: .constant(false))
    }
}
