//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/22/22.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    
    static func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    static func getLoggedInUserId() -> String {
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    static func logout() {
        try? Auth.auth().signOut()
    }
    
    static func sendPhoneNumber(phone: String) {
        
        // Send the phone number to Firebase Auth
        PhoneAuthProvider.provider().verifyPhoneNumber(phone,
                                                       uiDelegate: nil)
        { verificationId, error in
       
            if error == nil {
                // Got the verification id
                UserDefaults.standard.set(verificationId, forKey: "authVerificationID")
            }
            else {
                // There was a problem sending the phone number
                // TODO: Notify the UI
            }
        }
    }
}
