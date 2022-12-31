//
//  CreateProfileTextfieldStyle.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/31/22.
//

import Foundation
import SwiftUI

struct CreateProfileTextfieldStyle: TextFieldStyle {
    
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color("input"))
                .cornerRadius(8)
                .frame(height: 46)
            
            // This references the Textfield
            configuration
                .font(Font.tabBar)
                .padding()
        }
        
    }
}
    

