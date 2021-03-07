//
//  UserListView.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
      ScrollView() {
        VStack(alignment: .leading, spacing: 20) {
          ForEach(0 ..< 10) { item in
            UserCell()
          }.padding(.leading)
        }
      }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
