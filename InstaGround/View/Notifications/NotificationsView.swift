//
//  NotificationsView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct NotificationsView: View {
  var body: some View {
    ScrollView {
      ForEach(0 ..< 15) { item in
        NotificationCell()
      }
    }
  }
}

struct NotificationsView_Previews: PreviewProvider {
  static var previews: some View {
    NotificationsView()
  }
}
