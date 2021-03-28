//
//  NotificationsViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 28/03/21.
//

import SwiftUI
import Firebase

class NotificationsViewModel: ObservableObject {
  @Published var notifications = [Notification]()
  
  func fetchNotifications() {
    
  }
  
  // static: you don't have to initialize the notificationViewModel everytime you want to upload this func and you'll be able to access it wherever you want.
  static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
    guard let user = AuthViewModel.shared.currentUser else { return }
    
    var data: [String: Any] = ["timestamp": Timestamp(date: Date()),
                               "username": user.username,
                               "uid": user.id ?? "",
                               "profileImageUrl": user.profileImageUrl,
                               "type": type.rawValue]
    
    if let post = post, let id = post.id {
      data["postId"] = id
    }
    
    COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
  }
}
