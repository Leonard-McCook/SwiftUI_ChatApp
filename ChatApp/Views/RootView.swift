//
//  ContentView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/14/22.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {
        
        VStack {
            
            Text("Hello, world!")
                .padding()
                .font(Font.chatHeading)
            
                Spacer()
            
                CustomTabBar()
       }
        
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
