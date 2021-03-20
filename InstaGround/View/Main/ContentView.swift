//
//  ContentView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI

struct ContentView: View {
  //  @State var selectedIndex = 0
  @EnvironmentObject var viewModel: AuthViewModel
  
  var body: some View {
    //        Text("Hello, world!")
    //            .padding()
    //      MainTabView(selectedIndex: $selectedIndex()
    //      MainTabView()
    
    // group is better than zstack, 'cause we are grouping views.
    Group {
      // if not logged in, show login
      if viewModel.userSession == nil {
        LoginView()
        
        // else, show main interface
      } else {
        if let user = viewModel.currentUser {
          MainTabView(user: user)
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
