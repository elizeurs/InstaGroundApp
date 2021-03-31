//
//  ResetPasswordView.swift
//  InstaGround
//
//  Created by Elizeu RS on 16/03/21.
//

import SwiftUI

struct ResetPasswordView: View {
  @EnvironmentObject var viewModel: AuthViewModel
  @Environment(\.presentationMode) var mode
  @Binding private var email: String
  
  init(email: Binding<String>) {
    self._email = email
  }
  
  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .bottom, endPoint: .top)
        .ignoresSafeArea()
      
      VStack {
        Image("instaground_logo_white")
          .resizable()
          .scaledToFit()
          .frame(width: 200)
          .padding(.top, 50)
          .padding(.bottom, 30)
        
        VStack(spacing: 20) {
          CustomTextField(text: $email, placeholder: Text("Email"), imagename: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .foregroundColor(.white)
            .padding(.horizontal, 32)
        }
        

        
        Button(action: {
          viewModel.resetPassword(withEmail: email)
        }, label: {
          Text("Send Reset Password Link")
            .font(.headline)
            .frame(width: 360, height: 50)
            .background(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding()
        })
        
        Spacer()
        
        Button(action: { mode.wrappedValue.dismiss() }, label: {
          HStack {
            Text("Already have an account")
              .font(.system(size: 14))
            Text("Sign In")
              .font(.system(size: 14, weight: .semibold))
          }.foregroundColor(.white)
        })
      }
    }
    .onReceive(viewModel.$didSendPasswordLink) { _ in
      self.mode.wrappedValue.dismiss()
    }
  }
}

struct ResetPasswordView_Previews: PreviewProvider {
  static var previews: some View {
    ResetPasswordView(email: .constant(""))
  }
}
