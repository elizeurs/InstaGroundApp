//
//  CommentsView.swift
//  InstaGround
//
//  Created by Elizeu RS on 25/03/21.
//

import SwiftUI

struct CommentsView: View {
  @State var commentText = ""
  
  var body: some View {
    VStack {
      // comment cells
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 24) {
          ForEach(0 ..< 10) { _ in
            CommentCell()
          }
        }
      }.padding()
      
      // input view
      CustomInputView(inputText: $commentText, action: uploadComment)
    }
  }
  
  func uploadComment() {
    
  }
}

struct CommentsView_Previews: PreviewProvider {
  static var previews: some View {
    CommentsView()
  }
}
