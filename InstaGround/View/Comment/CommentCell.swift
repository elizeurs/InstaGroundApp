//
//  CommentCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 25/03/21.
//

import SwiftUI

struct CommentCell: View {
    var body: some View {
      HStack {
        Image("touropia")
          .resizable()
          .scaledToFill()
          .frame(width: 36, height: 36)
          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        
        Text("touropia").font(.system(size: 14, weight: .semibold)) + Text(" What a wonderful world!").font(.system(size: 14))
        
        Spacer()
        
        Text("2m")
          .foregroundColor(.gray)
          .font(.system(size: 12))
      }.padding(.horizontal)
    }
}

struct CommentCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentCell()
    }
}
