//
//  UploadPostView.swift
//  InstaGround
//
//  Created by Elizeu RS on 08/03/21.
//

import SwiftUI

struct UploadPostView: View {
    var body: some View {
      VStack {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
          Image(systemName: "plus.circle")
            .font(.system(size: 200, weight: .ultraLight))
            .foregroundColor(.black)
        })
        
        Spacer()
        
      }.padding()
    }
}

struct UploadPostView_Previews: PreviewProvider {
    static var previews: some View {
        UploadPostView()
    }
}
