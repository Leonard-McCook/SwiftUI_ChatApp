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
    
    @StateObject var settingsViewModel = SettingsViewModel()
    @StateObject var contactsViewModel = ContactsViewModel()
    @StateObject var chatViewModel = ChatViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(contactsViewModel)
                .environmentObject(chatViewModel)
                .environmentObject(settingsViewModel)
                .preferredColorScheme(settingsViewModel.isDarkMode ? .dark : .light)
        }
    }
}
