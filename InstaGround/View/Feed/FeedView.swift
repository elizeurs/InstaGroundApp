//
//  FeedView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI



struct FeedView: View {
  var body: some View {
    ScrollView {
      ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
        FeedCell()
      }
    }
  }

}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
