//
//  SearchView.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct SearchView: View {
  @State var searchText = ""
  @State var inSearchMode = false
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText)
      
      ZStack {
        if inSearchMode {
          UserListView()
        }else {
          PostGridView()
        }
      }
    }
  }
}

struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      SearchView()
        .padding()
    }
    
  }
}
