//
//  EditProfileViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 31/03/21.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
  var user: User
  @Published var uploadComplete = false
  
  init(user: User) {
    self.user = user
  }
  
  func saveUserBio(_ bio: String) {
//    print("Save data...")
    guard let uid = user.id else { return }
    
    COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
      self.user.bio = bio
      self.uploadComplete = true
    }
  }
}
