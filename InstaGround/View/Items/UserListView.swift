//
//  UserListView.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct UserListView: View {
  @ObservedObject var viewModel: SearchViewModel
  @Binding var searchText: String
  
  var users: [User] {
    return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
  }
  
    var body: some View {
      ScrollView() {
        LazyVStack(alignment: .leading, spacing: 20) {
//          ForEach(0 ..< 10) { item in
//          ForEach(viewModel.users) { _ in
//          ForEach(viewModel.users) { user in
          ForEach(users) { user in
            NavigationLink(
              destination: LazyView(ProfileView(user: user)),
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
