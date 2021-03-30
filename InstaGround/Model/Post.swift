//
//  Post.swift
//  InstaGround
//
//  Created by Elizeu RS on 23/03/21.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
  @DocumentID var id: String?
  let ownerUid: String
  let ownerUsername: String
  let caption: String
  var likes: Int
  let imageUrl: String
  let timestamp: Timestamp
  let ownerImageUrl: String
  
  var didLike: Bool? = false
  
  var user: User?
}
