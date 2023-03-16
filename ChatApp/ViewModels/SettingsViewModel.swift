//
//  SettingsViewModel.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 3/16/23.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    @AppStorage(Constants.DarkModeKey) var isDarkMode = false
    
}
