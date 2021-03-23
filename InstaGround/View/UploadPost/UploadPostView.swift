//
//  UploadPostView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct UploadPostView: View {
  @State private var selectedImage: UIImage?
  @State var postImage: Image?
  @State var captionTest = ""
  @State var imagePickerPresented = false
  @Binding var tabIndex: Int
  @ObservedObject var viewModel = UploadPostViewModel()
  
  var body: some View {
    VStack {
      if postImage == nil {
        Button(action: { imagePickerPresented.toggle() }, label: {
          Image(systemName: "plus.circle")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .font(.system(size: 200, weight: .ultraLight))
            .foregroundColor(.black)
            .padding()
        }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {
          ImagePicker(image: $selectedImage)
        })
        
        Spacer()

      } else if let image = postImage {
        HStack(alignment: .top) {
//          Image("touropia")
          image
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
        
//          TextField("Enter your caption... ", text: $captionTest)
          TextArea(text: $captionTest, placeholder: "Enter your caption..")
            .frame(height: 200)
        }.padding()
        
        HStack(spacing: 16) {
          Button(action: {
            captionTest = ""
            postImage = nil
          }, label: {
            Text("Cancel")
              .font(.system(size: 16, weight: .semibold))
              .frame(width: 172, height: 50)
              .background(Color.red)
              .cornerRadius(5)
              .foregroundColor(.white)
          })
          
          Button(action: {
            if let image = selectedImage {
              viewModel.uploadPost(caption: captionTest, image: image) { _ in
                captionTest = ""
                postImage = nil
                tabIndex = 0
              }
            }
          }, label: {
            Text("Share")
              .font(.system(size: 16, weight: .semibold))
              .frame(width: 172, height: 50)
              .background(Color.blue)
              .cornerRadius(5)
              .foregroundColor(.white)
          })
        }
        .padding()
        
        Spacer()
        
      }
    }
  }
}

extension UploadPostView {
  func loadImage() {
    guard let selectedImage = selectedImage else { return }
    postImage = Image(uiImage: selectedImage)
  }
}

//struct UploadPostView_Previews: PreviewProvider {
//  static var previews: some View {
//    UploadPostView()
//  }
//}

