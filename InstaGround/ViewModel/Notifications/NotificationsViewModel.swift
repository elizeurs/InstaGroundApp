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
  
  init() {
    fetchNotifications()
  }
  
  func fetchNotifications() {
    guard let uid = AuthViewModel.shared.userSession?.uid else { return }
    
    let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications")
      .order(by: "timestamp", descending: true)
    
    query.getDocuments { snapshot, _ in
      guard let documents = snapshot?.documents else { return }
      self.notifications = documents.compactMap({ try? $0.data(as: Notification.self) })
      
      print(self.notifications)
    }
  }
  
  // static: you don't have to initialize the notificationViewModel everytime you want to upload this func and you'll be able to access it wherever you want.
  static func uploadNotification(toUid uid: String, type: NotificationType, post: Post? = nil) {
    guard let user = AuthViewModel.shared.currentUser else { return }
    guard uid != user.id else { return }
    
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
