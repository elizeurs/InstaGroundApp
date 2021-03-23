//
//  PostGridView.swift
//  InstaGround
//
//  Created by Elizeu RS on 07/03/21.
//

import SwiftUI

struct PostGridView: View {
@ObservedObject var viewModel = FeedViewModel()
  
let items  =  [GridItem(), GridItem(), GridItem()]
  let width = UIScreen.main.bounds.width / 3

    var body: some View {
      LazyVGrid(columns: items, spacing: 2, content: {
//        ForEach(0 ..< 15) { item in
        ForEach(viewModel.posts) { post in

          NavigationLink(
            destination: FeedCell(post: post),
            label: {
              Image("london-landscape")
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipped()
            })
        }
      })
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
