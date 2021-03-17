//
//  LoginView.swift
//  InstaGround
//
//  Created by Elizeu RS on 12/03/21.
//

import SwiftUI

struct LoginView: View {
  @State var email = ""
  @State var password = ""
  @EnvironmentObject var viewModel: AuthViewModel
  
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
            
            CustomSecureField(text: $password, placeholder: Text("Password"))
              .padding()
              .background(Color(.init(white: 1, alpha: 0.15)))
              .cornerRadius(10)
              .foregroundColor(.white)
              .padding(.horizontal, 32)
  
          }
          
          HStack {
            
            Spacer()
            
            Button(action: {}, label: {
              Text("Forgot Password?")
            })
          }
          .padding(.horizontal, 32)
          .padding(.top)
          .foregroundColor(.white)
          .font(.system(size: 14, weight: .semibold))
          
          Button(action: {
            viewModel.login()
          }, label: {
            Text("Sign In")
              .font(.headline)
              .frame(width: 360, height: 50)
              .background(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
              .foregroundColor(.white)
              .clipShape(Capsule())
              .padding()
          })
          
          Spacer()
          
          HStack {
            Text("Don't have an account?")
            Text(" Sign Up")
              .fontWeight(.semibold)
          }
          .foregroundColor(.white)
          .padding(.bottom, 30)
        }
      }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
