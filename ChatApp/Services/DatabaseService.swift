//
//  DatabaseService.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/4/23.
//

import Foundation
import Contacts
import Firebase
import UIKit    


class DatabaseService {
    
    func getPlatformUsers(localContacts: [CNContact], completion: @escaping([User]) -> Void) {
        // The array where we're storing fetched platform users
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
        let db = Firestore.firestore()
        
        // Perform queries while we still have phone numbers to look up
        while !lookupPhoneNumbers.isEmpty {
            
            // Get the first < 10 phone numbers to look up
            let tenPhoneNumbers = Array(lookupPhoneNumbers.prefix(10))
            
            // Remove the < 10 that we're looking up
            lookupPhoneNumbers = Array(lookupPhoneNumbers.dropFirst(10))
            
            let query = db.collection("users").whereField("phone", in: lookupPhoneNumbers)
            
            // Retrieve the users that are on the platform
            query.getDocuments { snapshot, error in
                
                // Check for errors
                if error == nil && snapshot != nil {
                    
                    // For each doc that was fetched, create a user
                    for doc in snapshot!.documents {
                        
                        if let user = try? doc.data(as: User.self) {
                            
                            // Append to the platform users away
                            platformUsers.append(user)
                        }
                    }
                    
                    // Check if we have anymore phone numbers to look up
                    // If not, we can call the completion block and we're done
                    if lookupPhoneNumbers.isEmpty {
                        
                        // Return these users
                        completion(platformUsers)
                        
                    }
                }
            }
        }
    }
    
    func setUserProfile(firstName: String, lastName: String, image: UIImage?) {
        
        // TODO: Guard against logged out users
        
        // Get a reference to Firestore
        let db = Firestore.firestore()
        
        // Set the profile data
        
        // TODO: After implementing authentication, create a document with the actual user's id
        let doc = db.collection("users").document()
        doc.setData(["firstname": firstName,
                     "lastName": lastName])
        
        // Check if an image is passed through
        
        // Upload the image data
        
        // Set that image path to the profile
        
        
    }
}
