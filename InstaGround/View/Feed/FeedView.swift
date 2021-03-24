//
//  FeedView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI



struct FeedView: View {
  @ObservedObject var viewModel = FeedViewModel()
  
  var body: some View {
    ScrollView {
//      ForEach(0 ..< 5) { item in
      ForEach(viewModel.posts) { post in
        FeedCell(viewModel: FeedCellViewModel(post: post))
      }
    }
  }

}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
