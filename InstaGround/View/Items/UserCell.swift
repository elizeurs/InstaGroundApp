//
//  UserCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct UserCell: View {
  let user: User
  
    var body: some View {
      HStack {
//        Image("the_travelbum")
        KFImage(URL(string: user.profileImageUrl))
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        
        VStack(alignment: .leading, spacing: 5) {
//          Text("the_travelbum")
          Text(user.username)
            .font(.system(size: 14, weight: .bold))
          
//          Text("Alexander Travelbum")
          Text(user.fullname)
            .font(.system(size: 14, weight: .light))
        }
        
        Spacer()
        
      }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
