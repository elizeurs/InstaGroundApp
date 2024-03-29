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
  @ObservedObject var viewModel = SearchViewModel()
  
  var body: some View {
    ScrollView {
      SearchBar(text: $searchText, isEditing: $inSearchMode)
        .padding(.top)
        .padding(.bottom)
      
      ZStack {
        if inSearchMode {
          UserListView(viewModel: viewModel, searchText: $searchText)
        }else {
          PostGridView(config: .explore)
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
