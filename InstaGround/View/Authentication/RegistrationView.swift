//
//  RegistrationView.swift
//  InstaGround
//
//  Created by Elizeu RS on 15/03/21.
//

import SwiftUI

struct RegistrationView: View {
  @State private var email = ""
  @State private var username = ""
  @State private var fullname = ""
  @State private var password = ""
  @State private var image: Image?
  @State private var selectedImage: UIImage?
  @State var imagePickerPresented = false
  @EnvironmentObject var viewModel: AuthViewModel
  
    var body: some View {
      ZStack {
        
        LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .bottom, endPoint: .top)
          .ignoresSafeArea()
        
        VStack(spacing: 20) {
          ZStack {
            if let image = image {
              image
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Circle())
            } else {
              Button(action: {
    //            print("Show image picker")
                self.imagePickerPresented.toggle()
              }, label: {
                Image(systemName: "plus.circle")
                  .font(.system(size: 150, weight: .ultraLight))
    //              .padding()
              })
              .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
                ImagePicker(image: $selectedImage)
              })
            }
          }
          
          CustomTextField(text: $email, placeholder: Text("Email"), imagename: "envelope")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .padding(.horizontal, 32)
          
          CustomTextField(text: $username , placeholder: Text("Username"), imagename: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .padding(.horizontal, 32)
          
          CustomTextField(text: $fullname , placeholder: Text("Full Name"), imagename: "person")
            .padding()
            .background(Color(.init(white: 1, alpha: 0.15)))
            .cornerRadius(10)
            .padding(.horizontal, 32)
          
          CustomSecureField(text: $password, placeholder: Text("Password"))
            .padding()
            .background(Color.init(white: 1, opacity: 0.15))
            .cornerRadius(10)
            .padding(.horizontal, 32)
          
          Button(action: {
            viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
          }, label: {
            Text("Sign Up")
              .font(.system(size: 18, weight: .semibold))
              .frame(width: 350, height: 20)
              .padding()
              .background(Color(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)))
              .clipShape(Capsule())
              
          })
          
          Spacer()
          
          HStack {
            Text("Already have an account?")
            Text("Sign In")
              .fontWeight(.semibold)
          }
          .padding(.bottom)
          
        }
      }
      .foregroundColor(.white)
    }
  
  func loadImage() {
    guard let inputImage = selectedImage else { return }
      image = Image(uiImage: inputImage)
  }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
