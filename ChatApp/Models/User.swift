//
//  User.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 1/4/23.
//

import Foundation
import FirebaseFirestoreSwift


struct User: Codable {
    
    @DocumentID var id: String?
    
    var firstname: String?
    
    var lastname: String?
    
    var phone: String?
    
    var photo: String?
}
