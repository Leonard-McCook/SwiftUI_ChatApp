//
//  Text-Helper.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/5/23.
//

import Foundation

class TextHelper {
    
    static func sanitizePhoneNumber(_ phone: String) -> String {
        
        return phone
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")
    }
}
