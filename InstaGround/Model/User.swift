//
//  User.swift
//  InstaGround
//
//  Created by Elizeu RS on 18/03/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
  let username: String
  let email: String
  let profileImageUrl: String
  let fullname: String
//  let uid: String
  @DocumentID var id: String?
  var isFollowed: Bool? = false
  
  var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
  
}
