//
//  MainTabView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI

struct MainTabView: View {
  @Binding var selectedIndex: Int
  let user: User
  
  var body: some View {
    NavigationView {
//      TabView() {
      TabView(selection: $selectedIndex) {
        //        Text("Feed")
        FeedView()
          .onTapGesture {
            selectedIndex = 0
          }
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }.tag(0)
        
        //        Text("Explore")
        SearchView()
          .onTapGesture {
            selectedIndex = 1
          }
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Explore")
          }.tag(1)
        
        //          Text("New Post")
        UploadPostView(tabIndex: $selectedIndex)
          .onTapGesture {
            selectedIndex = 2
          }
          .tabItem {
            Image(systemName: "plus.app")
            Text("Post")
          }.tag(2)
        
        //          Text("Notifications")
        NotificationsView()
          .onTapGesture {
            selectedIndex = 3
          }
          .tabItem {
            Image(systemName: "heart")
            Text("Notifications")
          }.tag(3)
        
        //          Text("Profile")
        ProfileView(user: user)
          .onTapGesture {
            selectedIndex = 4
          }
          .tabItem {
            Image(systemName: "person")
            Text("Profile")
          }.tag(4)
      }
      .navigationTitle(tabTitle)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarItems(leading: logoutButton)
      .accentColor(.black)
    }
  }
  
  var logoutButton: some View {
    Button(action: {
      AuthViewModel.shared.signout()
    }, label: {
      Text("Logout").foregroundColor(.black)
    })
  }
  
  
  var tabTitle: String {
    switch selectedIndex {
    case 0: return "Feed"
    case 1: return "Explore"
    case 2: return "New Post"
    case 3: return "Notifications"
    case 4: return "Profile"
    default: return ""
    }
  }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView()
//    }
//}
