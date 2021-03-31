//
//  LazyView.swift
//  InstaGround
//
//  Created by Elizeu RS on 30/03/21.
//

//import Foundation
import SwiftUI

struct LazyView<Content: View>: View {
  let build: () -> Content
  
  init(_ build: @autoclosure @escaping() -> Content) {
    self.build = build
  }
  
  var body: Content {
    build()
  }
}
