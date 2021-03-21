//
//  ProfileViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 20/03/21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
//  let user: User
  @Published var user: User
  
  init(user: User) {
    self.user = user
  }
  
  func follow() {
//    print("DEBUG: Follow user...")
    guard let uid = user.id else { return }
    UserService.follow(uid: uid) { _ in
//      print("Successfully followed \(self.user.username)")
      self.user.isFollowed = true
    }
  }
  
  func unfollow() {
    print("DEBUG: Unfollow user...")
  }
  
  func checkIfUserIsFollowed() {
    
  }
}
