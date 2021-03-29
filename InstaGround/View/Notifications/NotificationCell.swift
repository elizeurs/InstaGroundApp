//
//  NotificationCell.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI
import KingfisherSwiftUI

struct NotificationCell: View {
//  let notification: Notification
  @ObservedObject var viewModel: NotificationCellViewModel
  
//  init(notification: Notification) {
//    self.viewModel = NotificationCellViewModel(notification: notification)
//  }
  
  var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
  
  init(viewModel: NotificationCellViewModel) {
    self.viewModel = viewModel
  }

  @State private var showPostImage = true
  
    var body: some View {
      HStack {
//        Image("touropia")
        KFImage(URL(string: viewModel.notification.profileImageUrl))
          .resizable()
          .scaledToFit()
          .frame(width: 50, height: 50)
          .clipShape(Circle())
        
//        Text("touropia").font(.system(size: 14, weight: .semibold)) + Text(" liked one of your posts.").font(.system(size: 14, weight: .light)) + Text(" 2w").font(.system(size: 14, weight: .light)).foregroundColor(.gray)
        Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold)) + Text(viewModel.notification.type.notificationMessage).font(.system(size: 14, weight: .light))
        
        Spacer()
        
//        if showPostImage {
        if viewModel.notification.type != .follow {
          Image("riffelsee")
            .resizable()
            .scaledToFill()
            .frame(width: 50, height: 50)
            .clipped()
        } else {
          Button(action: {
            isFollowed ? viewModel.unfollow() : viewModel.follow()
          }, label: {
            Text(isFollowed ? "Following" : "Follow")
              .font(.system(size: 14, weight: .semibold))
              .frame(width: 100, height: 32)
              .foregroundColor(isFollowed ? .black : .white)
              .background(Color(isFollowed ? .white : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
              .overlay(RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0))
          })
        }
      }.padding(.horizontal)
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
