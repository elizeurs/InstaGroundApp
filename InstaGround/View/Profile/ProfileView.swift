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
        
        PostGridView()
      }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
