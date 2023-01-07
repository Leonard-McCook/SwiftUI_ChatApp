//
//  CreateProfileView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/24/22.
//

import SwiftUI

struct CreateProfileView: View {
    
    @Binding var currentStep: OnboardingStep
    
    @State var firstName = ""
    @State var lastName = ""
    
    @State var selectedImage: UIImage?
    @State var isPickerShowing = false
    
    var body: some View {
        
        VStack {
            
            Text("Setup your Profile")
                .font(Font.titleText)
                .padding(.top, 52)
            
            Text("Just a few more details to get started")
                .font(Font.bodyParagraph)
                .padding(.top, 12)
            
            Spacer()
            
            // Profile image button
            Button {
                
                // Show action sheet
                isPickerShowing = true
                
                
            } label: {
                
                ZStack {
                    
                    Circle()
                        .foregroundColor(Color.white)
                    
                    
                    Circle()
                        .stroke(Color("create-profile-border"), lineWidth: 2)
                    
                    Image(systemName: "camera.fill")
                        .tint(Color("icons-input"))
                    
                }
                .frame(width: 134, height: 134)
                
            }
            
            Spacer()
            
            // First Name
            TextField("First Name", text: $firstName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            
            // Last Name
            TextField("Last Name", text: $lastName)
                .textFieldStyle(CreateProfileTextfieldStyle())
            
            
            Spacer()
            
            Button {
                // Next step
                
                currentStep = .contacts
                
            } label: {
                Text("Next")
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding(.bottom, 87)
            
        }
        .padding(.horizontal)
        .sheet(isPresented: $isPickerShowing) {
            
            // Show the image picker
            ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
        }
    }
    
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView(currentStep:
                .constant(.profile))
    }
}
