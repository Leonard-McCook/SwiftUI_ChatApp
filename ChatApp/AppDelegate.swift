//
//  AppDelegate.swift
//  ChatApp
//
//  Created by Leonard McCook-Carr on 12/22/22.
//

import Foundation
import UIKit
import FirebaseCore

class AppDelegate: UIResponder, UIApplicationDelegate {

//  var window: UIWindow?

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
                   [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
