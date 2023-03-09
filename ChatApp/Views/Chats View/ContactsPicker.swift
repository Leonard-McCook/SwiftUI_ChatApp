//
//  ContactsPicker.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 3/3/23.
//

import SwiftUI

struct ContactsPicker: View {
    
    @Binding var isContactsPickerShowing: Bool
    @Binding var selectedContacts: [User]
    
    @EnvironmentObject var contactsViewModel: ContactsViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView {
                    ForEach(contactsViewModel.filteredUsers) { user in
                        
                        // Determine if this user is a selected contact
                        let isSelectedContact = selectedContacts.contains { u in
                            u.id == user.id
                        }
                        
                        
                        
                        ZStack {
                            ContactRow(user: user)
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    // Toggle the user to ne selected or not
                                    if isSelectedContact {
                                        
                                        
                                        // Find index of this contact
                                        let index = selectedContacts.firstIndex(of: user)
                                        
                                        // Remove this contact from the selected pool
                                        if let index = index {
                                            selectedContacts.remove(at: index )
                                        }
                                    }
                                    else {
                                        
                                        // Impose the limit of 3
                                        if selectedContacts.count < 3 {
                                            // Select this contact
                                            selectedContacts.append(user)
                                        }
                                        else  {
                                            // TODO: Show message to indicate limit reached
                                        }
                                    }
                                    
                                } label: {
                                    
                                    Image(systemName: isSelectedContact ? "checkmark.circle" : "checkmark.circle")
                                        .resizable()
                                        .foregroundColor(Color("button-primary"))
                                        .frame(width: 25, height: 25)
                                }
                            }
                        }
                        .padding(.top, 18)
                        .padding(.horizontal)
                    }
                }
                
                Button {
                    // Done Dismiss the contct picker
                    isContactsPickerShowing = false
                    
                } label: {
                    
                    ZStack {
                        Color("button-primary")
                        
                        Text("Done")
                            .font(Font.button)
                            .foregroundColor(Color("text-button"))
                    }
                }
                .frame(height: 56)
            }
        }
        .onAppear {
            // Clear any filters
            contactsViewModel.filterContacts(filterBy: "")
        }
    }
}

