//
//  ContactRow.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/24/23.
//

import SwiftUI

struct ContactRow: View {
    var body: some View {
        
        AsyncImage(url: URL(string: "")) { phase in
            
            switch phase {
                
            case AsyncImagePhase.empty:
                // Currently fetching
                ProgressView()
                
            case AsyncImagePhase.success(let image):
                // Display the fetched image
                image
                
            case AsyncImagePhase.failure(let error):
                // Couldn't fetch profile photo
                Circle()
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow()
    }
}
