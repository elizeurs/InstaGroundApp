//
//  NotificationCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct NotificationCell: View {
  let notification: Notification
  @State private var showPostImage = true
  
    var body: some View {
      HStack {
//        Image("touropia")
        KFImage(URL(string: notification.profileImageUrl))
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50)
          .clipShape(Circle())
        
//        Text("touropia").font(.system(size: 14, weight: .semibold)) + Text(" liked one of your posts.").font(.system(size: 14, weight: .light)) + Text(" 2w").font(.system(size: 14, weight: .light)).foregroundColor(.gray)
        Text(notification.username).font(.system(size: 14, weight: .semibold)) + Text(notification.type.notificationMessage).font(.system(size: 14, weight: .light))
        
        Spacer()
        
//        if showPostImage {
        if notification.type != .follow {
          Image("riffelsee")
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipped()
        } else {
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Follow")
              .padding(.horizontal, 20)
              .padding(.vertical, 8)
              .background(Color(.systemBlue))
              .foregroundColor(.white)
              .clipShape(Capsule())
              .font(.system(size: 14, weight: .semibold))
          })
        }
      }.padding()
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
