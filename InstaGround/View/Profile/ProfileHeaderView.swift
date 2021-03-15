//
//  ProfileHeaderView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct ProfileHeaderView: View {
  @State var isCurrentUser = false
  @State var isFollowed = false
  
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        HStack {
          Image("touropia")
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          
          Spacer()
          
          VStack {
            Text("3")
              .font(.system(size: 14, weight: .semibold))
            Text("Post")
              .font(.system(size: 14, weight: .light))
          }
          
          Spacer()
          
          VStack {
            Text("7")
              .font(.system(size: 14, weight: .semibold))
            Text("Followers")
              .font(.system(size: 14, weight: .light))
          }
          
          Spacer()
          
          VStack {
            Text("12")
              .font(.system(size: 14, weight: .semibold))
            Text("Following")
              .font(.system(size: 14, weight: .light))
          }
          
          Spacer()
          
        }
        
        Text("Touropia")
          .font(.system(size: 18, weight: .semibold))
          .padding(.top)
        
        Text("Happy exploring!")
          .padding(.top, 1)
      }.padding(.leading)
      
      
      ProfileActionButton(isCurrentUser: $isCurrentUser, isFollowed: $isFollowed)
        .padding()
    }
  }
}

struct ProfileHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileHeaderView()
  }
}
