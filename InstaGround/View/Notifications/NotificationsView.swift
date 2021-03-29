//
//  NotificationsView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct NotificationsView: View {
  @ObservedObject var viewModel = NotificationsViewModel()
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: 20) {
        //      ForEach(0 ..< 15) { item in
        ForEach(viewModel.notifications) { notification in
          //        NotificationCell(notification: notification)
          NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
            .padding(.top)
        }
      }
    }
  }
}

struct NotificationsView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationsView()
  }
}
