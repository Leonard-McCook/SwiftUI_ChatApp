//
//  CustomTabBar.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/18/22.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        
        HStack (alignment: .center) {
            
            Button {
                // Switch to chats
            } label: {
                
                GeometryReader { geo in
                    
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: geo.size.width/2, height: 4)
                        .padding(.leading, geo.size.width/4)
                    
                    VStack (alignment: .center, spacing: 4) {
                        
                        Image(systemName: "bubble.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        
                        Text("Chats")
                            .font(Font.tabBar)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    
                }
                
            }
            .tint(Color("icons-secondary"))
            
            
            Button {
                // New Chat
            } label: {
                
                
                
                VStack (alignment: .center, spacing: 4) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                    
                    
                    Text("New Chat")
                        .font(Font.tabBar)
                }
                
            }
            .tint(Color("icons-primary"))
            
            Button {
                // Switch to chats
            } label: {
                
                GeometryReader { geo in
                    
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(width: geo.size.width/2, height: 4)
                        .padding(.leading, geo.size.width/4)
                    
                    VStack (alignment: .center, spacing: 4) {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                        
                        Text("Contacts")
                            .font(Font.tabBar)
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                }
            }
            .tint(Color("icons-secondary"))
            
        }
        .frame(height: 82)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}

