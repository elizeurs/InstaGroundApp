//
//  User.swift
//  InstaGround
//
//  Created by Elizeu RS on 16/03/21.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
  let username: String
  let email: String
  let profileImageUrl: String
  let fullname: String
  @DocumentID var id: String?
  var bio: String?
  
}
