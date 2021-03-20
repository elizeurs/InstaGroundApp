//
//  ProfileActionButton.swift
//  InstaGround
//
//  Created by Elizeu RS on 10/03/21.
//

import SwiftUI

struct ProfileActionButton: View {
  let isCurrentUser: Bool
  var isFollowed = false
  
    var body: some View {
      
        if isCurrentUser {
          Button(action: {
              print("Button action")
          }) {
              Text("Edit Profile")
                .frame(minWidth: 0, maxWidth: .infinity)
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .semibold))
                .padding()
                .border(Color.black, width: 1)
                .padding(.top)

          }
        } else {
          HStack() {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Text(isFollowed ? "Following" : "Follow")
                .frame(width: 150, height: 50)
                .foregroundColor(isFollowed ? .black : .white)
                .font(.system(size: 18, weight: .semibold))
                .background(Color(isFollowed ? .white : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
                .border(Color(isFollowed ? .black : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
            })
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Text("Message")
                .frame(width: 150, height: 50)
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .semibold))
                .border(Color.black, width: 1)
            })
          }
        }
      }
    }

//struct ProfileActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//      ProfileActionButton(isCurrentUser: .constant(false), isFollowed: .constant(true))
//    }
//}
