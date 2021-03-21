//
//  ProfileHeaderView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct ProfileHeaderView: View {
//  let user: User
  @ObservedObject var viewModel: ProfileViewModel

  
  @State var isFollowed = false
  
  var body: some View {
    VStack {
      VStack(alignment: .leading) {
        HStack {
//          Image("touropia")
          KFImage(URL(string: viewModel.user.profileImageUrl))
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
          
          Spacer()
          
          HStack(spacing: 16) {
            UserStatView(value: 1, title: "Post")
            UserStatView(value: 2, title: "Followers")
            UserStatView(value: 4, title: "Following")
          }.padding(.trailing, 16)
                    
        }
        
//        Text("Touropia")
        Text(viewModel.user.fullname)
          .font(.system(size: 18, weight: .semibold))
          .padding(.top)
        
        Text("Happy exploring!")
          .padding(.top, 1)
      }.padding(.leading)
      
      
//      ProfileActionButton(isCurrentUser: viewModel.isCurrentUser, isFollowed: true)
      ProfileActionButtonView(viewModel: viewModel)
        .padding()
    }
  }
}

//struct ProfileHeaderView_Previews: PreviewProvider {
//  static var previews: some View {
//    ProfileHeaderView()
//  }
//}
