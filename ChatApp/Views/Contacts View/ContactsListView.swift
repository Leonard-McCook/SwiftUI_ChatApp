//
//  ContactsListView.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/20/23.
//

import SwiftUI

struct ContactsListView: View {
    
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    @State var filterText = ""
    
    var body: some View {
        
        VStack {
            // Heading
            HStack {
                Text("Contacts")
                    .font(Font.pageTitle)
                
                Spacer()
                
                Button {
                    // TODO: Settings
                } label: {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .tint(Color("icons-secondary"))
                }
            }
            
            // Search Bar
            ZStack {
                Rectangle()
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                
                
                TextField("Search contact or number", text: $filterText)
                    .font(Font.tabBar)
                    .foregroundColor(Color("text-textfied"))
                    .padding()
                    
            }
            .frame(height: 46)
            
            // List
            List(contactsViewModel.users) { user in
                
                // TODO: Display rows
            }
            .listStyle(.plain)
        }
        .padding(.horizontal)
    }
}

struct ContactsListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsListView()
    }
}
