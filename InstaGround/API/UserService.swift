//
//  UserService.swift
//  InstaGround
//
//  Created by Elizeu RS on 21/03/21.
//

import Firebase

struct UserService {
  
  static func follow(uid: String, completion: ((Error?) -> Void)?) {
    guard let currentUId = AuthViewModel.shared.userSession?.uid else { return }
    
    COLLECTION_FOLLOWING.document(currentUId).collection("user-following").document(uid).setData([:]) { _ in
      COLLECTION_FOLLOWERS.document(uid).collection("user-followers").document(currentUId).setData([:], completion: completion)
    }
  }
  
  static func unfollow() {
    
  }
  
  static func checkIfUserIsFollowed() {
    
  }
}
