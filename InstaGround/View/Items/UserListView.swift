//
//  UserListView.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct UserListView: View {
  @ObservedObject var viewModel: SearchViewModel
  
    var body: some View {
      ScrollView() {
        LazyVStack(alignment: .leading, spacing: 20) {
//          ForEach(0 ..< 10) { item in
//          ForEach(viewModel.users) { _ in
          ForEach(viewModel.users) { user in
            NavigationLink(
              destination: ProfileView(),
              label: {
                UserCell(user: user)
                  .padding(.leading)
              })
          }
        }
      }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
