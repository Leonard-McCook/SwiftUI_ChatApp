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
                VStack (alignment: .leading) {
                    
                    
                    // Back arrow
                    Button {
                        // Dismiss chat window
                        isChatShowing = false
                        
                    } label: {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("text-header"))
                    }
                  
                    // Name
                    Text("Marcus Fenix")
                        .font(Font.chatHeading)
                        .foregroundColor(Color("text-header"))
                }
                
                Spacer()
                
                // Profile image
                ProfilePicView(user: User())
            }
            .frame(height: 104)
            
            // Chat log
            ScrollView {
                
            }
            .background(Color("background"))
                
            // Chat message bar
            ZStack {
                Color("background")
                    
                
                HStack {
                    // Camera button
                    Button {
                        // TODO: Show picker
                    } label: {
                        Image(systemName: "camera")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    // Textfield
                    // Send button
                    
                }
            }
            .frame(height: 76)
        }
        
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(isChatShowing: .constant(false))
    }
}
