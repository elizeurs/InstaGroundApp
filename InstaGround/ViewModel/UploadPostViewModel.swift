//
//  UploadPostViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 22/03/21.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
  
  func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
    guard let user = AuthViewModel.shared.currentUser else { return }
    
    ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
      let data = ["caption": caption,
                  "timestamp": Timestamp(date: Date()),
                  "likes": 0,
                  "imageUrl": imageUrl,
                  "ownerUid": user.id ?? "",
                  "ownerImageUrl":  user.profileImageUrl,
                  "ownerUsername": user.username] as [String : Any]
      
      COLLECTION_POSTS.addDocument(data: data, completion: completion)
      
//      COLLECTION_POSTS.addDocument(data: data) { _ in
//        print("DEBUG: Uploaded post")
//      }
    }
  }
}
