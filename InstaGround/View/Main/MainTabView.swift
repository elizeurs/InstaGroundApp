//
//  MainTabView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
      NavigationView {
        TabView {
  //        Text("Feed")
          FeedView()
            .tabItem {
              Image(systemName: "house")
              Text("Home")
            }
          
  //        Text("Explore")
            SearchView()
            .tabItem {
              Image(systemName: "magnifyingglass")
              Text("Home")
            }
          
          Text("New Post")
            .tabItem {
              Image(systemName: "plus.app")
              Text("Post")
            }
          
//          Text("Notifications")
            NotificationsView()
            .tabItem {
              Image(systemName: "heart")
              Text("Notifications")
            }
          
          Text("Profile")
            .tabItem {
              Image(systemName: "person")
              Text("Profile")
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .accentColor(.black)
        }
      }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
