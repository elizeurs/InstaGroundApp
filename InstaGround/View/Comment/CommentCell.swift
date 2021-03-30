//
//  CommentCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 25/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct CommentCell: View {
  let comment: Comment
  
    var body: some View {
      HStack {
//        Image("touropia")
        KFImage(URL(string: comment.profileImageUrl))
          .resizable()
          .scaledToFill()
          .frame(width: 36, height: 36)
          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        
//        Text("touropia").font(.system(size: 14, weight: .semibold)) + Text(" What a wonderful world!").font(.system(size: 14))
        Text(comment.username).font(.system(size: 14, weight: .semibold)) + Text(comment.commentText).font(.system(size: 14))

        Spacer()
        
//        Text("2m")
        Text(" \(comment.timestampString ?? "")")
          .foregroundColor(.gray)
          .font(.system(size: 12))
      }.padding(.horizontal)
    }
}

//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}
