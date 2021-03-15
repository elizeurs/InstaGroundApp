//
//  FeedCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
      VStack(alignment: .leading) {
        HStack {
          Image("the_travelbum")
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          
          Text("the_travelbum")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
          
          Spacer()
        }.padding()
        
        Image("lencois_maranhenses")
          .resizable()
          .frame(maxHeight: 300)
        
        HStack {
          Image(systemName: "heart")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          
          Image(systemName: "bubble.right")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          
          Image(systemName: "paperplane")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
          
          Spacer()
        }
        .padding(.leading)
        .padding(.top, 5)
        .padding(.bottom, 2)
        
        VStack(alignment: .leading, spacing: 5) {
          Text("0 likes")
          
          Text("the_travelbum").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/) + Text(" You won't believe this place exists in Brazil")
          
          Text("1w")
            .foregroundColor(.gray)
        }
        .padding(.leading)
      }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
