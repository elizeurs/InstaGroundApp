//
//  NotificationCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
      HStack {
        Image("touropia")
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50)
          .clipShape(Circle())
        
        Text("touropia").font(.system(size: 14, weight: .semibold)) + Text(" liked one of your posts.").font(.system(size: 14, weight: .light)) + Text(" 2w").font(.system(size: 14, weight: .light)).foregroundColor(.gray)
        
        Spacer()
        
        Image("riffelsee")
          .resizable()
          .scaledToFill()
          .frame(width: 50, height: 50)
          .clipped()
      }.padding()
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
