//
//  ConversationView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/30/23.
//

import SwiftUI

struct ConversationView: View {
    
    @Binding var isChatShowing: Bool
    
    @State var chatMessage = ""
    
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
                    .padding(.bottom, 16)
                  
                    // Name
                    Text("Marcus Fenix")
                        .font(Font.chatHeading)
                        .foregroundColor(Color("text-header"))
                }
                
                Spacer()
                
                // Profile image
                ProfilePicView(user: User())
            }
            .padding(.horizontal)
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
                            .tint(Color("icons-secondary"))
                    }
                    // Textfield
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(Color("date-pill"))
                            .cornerRadius(50)
                        
                        TextField("Type your message", text: $chatMessage)
                            .foregroundColor(Color("text-input"))
                            .font(Font.bodyParagraph)
                            .padding(10)
                        
                        // Emoji button
                        HStack {
                            Spacer()
                            
                            Button {
                                // Emojis
                            } label: {
                                Image(systemName: "face.smilling")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("text-input"))
                                
                            
                            }
                        }
                        .padding(.trailing, 12)
                        
                    }
                    
                    
                    // Send button
                    Button {
                        // TODO: Send messagem
                    } label: {
                        Image(systemName: "paperplane.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .tint(Color("icons-primary"))
                        
                    }
                    
                }
                .padding(.horizontal)
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
