//
//  FeedCellViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 24/03/21.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
  @Published var post: Post
  
  init(post: Post) {
    self.post = post
  }
  
  func like() {
    print("Like post")
  }
  
  func unlike() {
    print("Unlike post")
  }
  
  func checkIfUserLikePost() {
    
  }
}
