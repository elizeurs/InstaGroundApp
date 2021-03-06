//
//  MainTabView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
      TabView {
//        Text("Feed")
        FeedView()
          .tabItem {
            Image(systemName: "house")
            Text("Home")
          }
        
        Text("Explore")
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Home")
          }
        
        Text("New Post")
          .tabItem {
            Image(systemName: "plus.app")
            Text("Post")
          }
        
        Text("Notifications")
          .tabItem {
            Image(systemName: "heart")
            Text("Notifications")
          }
        
        Text("Profile")
          .tabItem {
            Image(systemName: "person")
            Text("Profile")
          }
      }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
