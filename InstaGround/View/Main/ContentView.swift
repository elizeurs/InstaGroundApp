//
//  ContentView.swift
//  InstaGround
//
//  Created by Elizeu RS on 05/03/21.
//

import SwiftUI

struct ContentView: View {
  @State var selectedIndex = 0
  
    var body: some View {
//        Text("Hello, world!")
//            .padding()
      MainTabView(selectedIndex: $selectedIndex)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
