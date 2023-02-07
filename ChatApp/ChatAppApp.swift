//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/14/22.
//

import SwiftUI

@main
struct ChatAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(ContactsViewModel())
                .environmentObject(ChatViewModel())
        }
    }
}
