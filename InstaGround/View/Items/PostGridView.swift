//
//  PostGridView.swift
//  InstaGround
//
//  Created by Elizeu RS on 07/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct PostGridView: View {
  private let items  =  [GridItem(), GridItem(), GridItem()]
  private let width = UIScreen.main.bounds.width / 3
  
  let config: PostGridConfiguration
  @ObservedObject var viewModel: PostGridViewModel
  
  init(config: PostGridConfiguration) {
    self.config = config
    self.viewModel = PostGridViewModel(config: config)
  }

    var body: some View {
      LazyVGrid(columns: items, spacing: 2, content: {
//        ForEach(0 ..< 15) { item in
        ForEach(viewModel.posts) { post in

          NavigationLink(
//            destination: FeedCell(post: post),
            destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
            label: {
//              Image("london-landscape")
              KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipped()
            })
        }
      })
    }
}

//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}
