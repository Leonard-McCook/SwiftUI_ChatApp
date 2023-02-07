//
//  ChatViewModel.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 2/7/23.
//

import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    
    @Published var chats = [Chat]()
    
}
