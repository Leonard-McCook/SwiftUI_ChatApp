//
//  SettingsView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 3/12/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
       
        
        
        
        ZStack {
            
            // Background
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                // Heading
                HStack {
                    Text("Settings")
                        .font(Font.pageTitle)
                    
                    Spacer()
                    
                    Button {
                        // TODO: Close settings view
                    } label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .tint(Color("icons-secondary"))
                    }
                    
                    
                }
                .padding(.top, 20)
                .padding(.horizontal)
                
                // The Form
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
