//
//  SearchView.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct SearchView: View {
  @State var searchText = ""
  
    var body: some View {
      ScrollView {
        VStack(alignment: .leading) {
          SearchBar(text: $searchText)
          
          UserListView()
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
