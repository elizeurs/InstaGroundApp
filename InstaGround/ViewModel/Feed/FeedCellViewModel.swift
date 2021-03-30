//
//  FeedCellViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 24/03/21.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
  @Published var post: Post
  
  var likeString: String {
    let label = post.likes == 1 ? "like" : "likes"
    return "\(post.likes) \(label)"
  }
  
  var timestampString: String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
    formatter.maximumUnitCount = 1
    formatter.unitsStyle = .abbreviated
    return  formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    
  }
  
  
  init(post: Post) {
    self.post = post
    checkIfUserLikePost()
  }
  
  func like() {
//    print("Like post")
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    guard let postId = post.id else { return }
    COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
      COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
        
        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes + 1])
        
        NotificationsViewModel.uploadNotification(toUid: self.post.ownerUid, type: .like, post: self.post)
        
        self.post.didLike = true
        self.post.likes += 1
      }
    }
  }
  
  func unlike() {
//    print("Unlike post")
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    guard let postId = post.id else { return }
    COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
      COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
        COLLECTION_POSTS.document(postId).updateData(["likes": self.post.likes - 1])
        
        self.post.didLike = false
        self.post.likes -= 1
      }
    }
  }
  
  func checkIfUserLikePost() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    guard let postId = post.id else { return }
    
    COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
      guard let didLike = snapshot?.exists else { return }
      self.post.didLike = didLike
    }
  }
}
