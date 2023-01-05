//
//  ContactsViewModel.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/2/23.
//

import Foundation
import Contacts

class ContactsViewModel: ObservableObject {
    
    private var localContacts = [CNContact]()

    func getLocalContacts() {
        
        DispatchQueue.init(label: "getcontacts").async {
            
            do {
                
                // Ask for permission
                let store = CNContactStore()
                
                // List of keys we want to get
                let keys = [CNContactPhoneNumbersKey,
                            CNContactGivenNameKey,
                            CNContactFamilyNameKey] as [CNKeyDescriptor]
                
                // Create a Fetch request
                let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
                // Get the contacts on the user's phone
                try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, sucess in
                    
                    // Do something with the contact
                    self.localContacts.append(contact)
                    
                })
                
                // TODO: see which local contacts are actually users of this app
                
            }
            catch {
                // Handle error
            }
            
        }
        
    }
}
