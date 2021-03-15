//
//  ProfileView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
      ScrollView {
        ProfileHeaderView()
          .padding(.top)
        
        PostGridView()
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
