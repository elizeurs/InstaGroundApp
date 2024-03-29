//
//  CommentViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 25/03/21.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
  private let post: Post
  
  init(post: Post) {
    self.post = post
  }
  
  func uploadComment(commentText: String) {
    guard let user = AuthViewModel.shared.currentUser else { return }
    guard let postId = post.id else { return }
    
    let data: [String: Any] = ["username": user.username,
                               "profileImageUrl": user.profileImageUrl,
                               "uid": user.id ?? "",
                               "timestamp": Timestamp(date: Date()),
                               "postOwnerUid": post.ownerUid,
                               "commentText": commentText]
    
    COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data) { error in
      if let error = error {
        print("DEBUG: Error uploading comment \(error.localizedDescription)")
        return
      }
    }
  }
  
  func fetchComment() {
    
  }
}
