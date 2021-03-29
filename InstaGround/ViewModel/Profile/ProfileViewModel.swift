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
    checkIfUserIsFollowed()
  }
  
  func follow() {
//    print("DEBUG: Follow user...")
    guard let uid = user.id else { return }
    UserService.follow(uid: uid) { _ in
//      print("Successfully followed \(self.user.username)")
      NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
      self.user.isFollowed = true
    }
  }
  
  func unfollow() {
//    print("DEBUG: Unfollow user...")
    guard let uid = user.id else { return }
    UserService.unfollow(uid: uid) { _ in
      self.user.isFollowed = false
    }
  }
  
  func checkIfUserIsFollowed() {
    guard !user.isCurrentUser else { return }
    guard let uid = user.id else { return }
    UserService.checkIfUserIsFollowed(uid: uid) { isFollowed in
      self.user.isFollowed = isFollowed
    }
  }
}
