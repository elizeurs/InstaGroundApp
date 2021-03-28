//
//  Comment.swift
//  InstaGround
//
//  Created by Elizeu RS on 25/03/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Decodable {
  @DocumentID var id: String?
  let username: String
  let postOwnerUid: String
  let profileImageUrl: String
  let commentText: String
  let timestamp: Timestamp
  let uid: String
}
