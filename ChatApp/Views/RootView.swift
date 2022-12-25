//
//  ContentView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/14/22.
//

import SwiftUI

struct RootView: View {
    
    @State var selectedTab: Tabs = .contacts
    
    @State var isOnboarding =
        !AuthViewModel.isUserLoggedIn()
    var body: some View {
        
        VStack {
            Image(systemName: "hammer.fill")
            Text("Under construction")
                .padding()
                .font(Font.chatHeading)
            
            Spacer()
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .fullScreenCover(isPresented: $isOnboarding) {
            // On dismiss
        } content: {
            // The onboarding sequence
            OnboardingContainerView()
        }
        
        
        
    }
    
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
