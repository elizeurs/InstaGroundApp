//
//  ProfileActionButtonView.swift
//  InstaGround
//
//  Created by Elizeu RS on 10/03/21.
//

import SwiftUI

struct ProfileActionButtonView: View {
//  let isCurrentUser: Bool
  @ObservedObject var viewModel: ProfileViewModel
//  var isFollowed = false
  var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
  @State var showEditProfile = false
  
  
    var body: some View {
      if viewModel.user.isCurrentUser {
          Button(action: {
//              print("Button action")
            showEditProfile.toggle()
          }) {
              Text("Edit Profile")
                .font(.system(size: 18, weight: .semibold))
                .frame(width: 360, height: 32)
                .foregroundColor(.black)
                .overlay(RoundedRectangle(cornerRadius: 3)
                          .stroke(Color.gray, lineWidth: 1))
          }.sheet(isPresented: $showEditProfile) {
            EditProfileView(viewModel: EditProfileViewModel(user: viewModel.user))
          }
        } else {
          HStack() {
            Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }, label: {
              Text(isFollowed ? "Following" : "Follow")
                .frame(width: 150, height: 32)
                .foregroundColor(isFollowed ? .black : .white)
                .font(.system(size: 14, weight: .semibold))
                .background(Color(isFollowed ? .white : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                .border(Color(isFollowed ? .black : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                .cornerRadius(3)
                .overlay(RoundedRectangle(cornerRadius: 3)
                          .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0))
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Text("Message")
                .frame(width: 150, height: 32)
                .foregroundColor(.black)
                .font(.system(size: 14, weight: .semibold))
                .border(Color.black, width: 1)
                .cornerRadius(3)
            })
          }
        }
      }
    }

//struct ProfileActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//      ProfileActionButton(isCurrentUser: .constant(false), isFollowed: .constant(true))
//    }
//}
