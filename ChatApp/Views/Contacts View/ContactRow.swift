//
//  ContactRow.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/24/23.
//

import SwiftUI

struct ContactRow: View {
    
    var user: User
    
    var body: some View {
        
        // Create URL from user photo url
        let photoUrl = URL(string: user.photo ?? "")
        
        ZStack {
            
            // Profile image
            AsyncImage(url: photoUrl) { phase in
                
                switch phase {
                    
                case .empty:
                    // Currently fetching
                    ProgressView()
                    
                case .success(let image):
                    // Display the fetched image
                    image
                        .resizable()
                        .scaledToFill()
                    
                case .failure:
                    // Couldn't fetch profile photo
                    //Diplay circle with first letter of first name
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                        
                        Text(user.firstname?.prefix(1) ?? "")
                            .bold()
                    }
                }
            }
            .frame(width: 44, height: 44)
            
            // Blue border
            Circle()
                .stroke(Color("create-profile-border"), lineWidth: 2)
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(user: User())
    }
}
