//
//  FeedViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 23/03/21.
//

import SwiftUI

class FeedViewModel: ObservableObject {
  @Published var posts = [Post]()
  
  init() {
    fetchPosts()
  }
  
  func fetchPosts() {
    COLLECTION_POSTS.getDocuments { snapshot, _ in
      guard let documents = snapshot?.documents else { return }
      self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
      
      print(self.posts)
    }
  }
}
