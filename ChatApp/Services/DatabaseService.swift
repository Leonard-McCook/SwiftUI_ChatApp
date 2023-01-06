//
//  DatabaseService.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/4/23.
//

import Foundation
import Contacts

class DatabaseService {
    
    func getPlatformUsers(localContacts: [CNContact], completion: @escaping([User]) -> Void) {
        
        var platformUsers = [User]()
        
        // Construct an array of string phone numbers to look up
        var lookupPhoneNumbers = localContacts.map { contact in
            
            // Turn the contact into a phone number as a string
            return TextHelper.sanitizePhoneNumber(contact.phoneNumbers.first?.value.stringValue ?? "")
            
            
        }
        // Make sure that there are lookup numbers
        guard lookupPhoneNumbers.count > 0 else {
            
            // Callback
            completion(platformUsers)
            return
        }
        
        // Query the database for these phone numbers
        
        // Retrieve the users that are on the platform
        
        // Return these users
        completion(platformUsers)
    }
    
}
