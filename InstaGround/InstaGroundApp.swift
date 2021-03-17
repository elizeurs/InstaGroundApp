//
//  InstaGroundApp.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI
import Firebase

@main
struct InstaGroundApp: App {
  init() {
    FirebaseApp.configure()
  }
  
    var body: some Scene {
        WindowGroup {
//            ContentView()
          RegistrationView().environmentObject(AuthViewModel())
        }
    }
}
