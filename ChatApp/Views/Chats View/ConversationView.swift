//
//  ConversationView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/30/23.
//

import SwiftUI

struct ConversationView: View {
    
    @Binding var isChatShowing: Bool
    
    var body: some View {
     
        VStack {
            
            // Chat header
            HStack {
                VStack {
                    
                    
                    // Back arrow
                    Button {
                        // Dismiss chat window
                        isChatShowing = false
                        
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("text-input"))
                    }
                  
                    // Name
                    Text("Marcus Fenix")
                        .font(Font.chatHeading)
                        .foregroundColor(Color("text-input"))
                }
                
                // Profile image
                ProfilePicView(user: User())
            }
            
            // Chat log
            ScrollView {
                
            }
                
            // Chat message bar
        }
        
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
