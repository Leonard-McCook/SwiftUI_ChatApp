//
//  WelcomeView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/24/22.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var currentStep: OnboardingStep
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image("onboarding-welcome")
            
            Text("Welcome to Chat App")
                .font(Font.titleText)
                .padding(.top, 32)
            
            Text("Simple and hassle-free chat experience")
                .font(Font.bodyParagraph)
                .padding(.top, 8)
            
            
            Spacer()
            
            Button {
                // Next step
                currentStep = .phonenumber
            } label: {
                Text("Try it Now")
            }
            .buttonStyle(OnboardingButtonStyle())
            
        
        
        Text(" By tapping 'Get Started', you agree to our Privacy Policy.")
            .font(Font.smallText)
            .padding(.top, 14)
            .padding(.bottom, 61)
        
    }
        .padding(.horizontal)
    
}
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(currentStep: .constant(.welcome))
    }
}
