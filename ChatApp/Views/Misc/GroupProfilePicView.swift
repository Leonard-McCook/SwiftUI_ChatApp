//
//  GroupProfilePicView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 3/7/23.
//

import SwiftUI

struct GroupProfilePicView: View {
    var users: [User]
    
    var body: some View {
        
        let offset = Int(30 / users.count) * -1
        
        ZStack {
            
            ForEach(users) { user in
                ProfilePicView(user: user)
                    .offset(x: CGFloat(offset))
            }
        }
    }
}

