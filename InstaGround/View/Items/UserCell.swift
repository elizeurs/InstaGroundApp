//
//  UserCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 06/03/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
      HStack {
        Image("the_travelbum")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
          .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        
        VStack(alignment: .leading, spacing: 5) {
          Text("the_travelbum")
            .font(.system(size: 14, weight: .bold))
          Text("Alexander Travelbum")
            .font(.system(size: 14, weight: .light))
        }
      }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
