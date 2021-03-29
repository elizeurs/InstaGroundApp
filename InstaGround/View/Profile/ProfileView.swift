 //
//  ProfileView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct ProfileView: View {
  let user: User
  @ObservedObject var viewModel: ProfileViewModel
  
  init(user: User) {
    self.user = user
    self.viewModel = ProfileViewModel(user: user)
  }
  
    var body: some View {
      ScrollView {
        VStack {
          ProfileHeaderView(viewModel: viewModel)
          
          PostGridView(config: .profile(user.id ?? ""))
        }.padding(.top)
      }
    }
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
