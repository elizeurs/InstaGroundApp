//
//  AuthViewModel.swift
//  InstaGround
//
//  Created by Elizeu RS on 16/03/21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
  @Published var userSession: FirebaseAuth.User?
  @Published var currentUser: User?
  
  static let shared = AuthViewModel()
  
  init() {
    userSession = Auth.auth().currentUser
    fetchUser()
  }
  
  func login(withEmail email: String, password: String) {
//    print("Login")
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if let error = error {
        print("DEBUG: Login failde \(error.localizedDescription)")
        return
      }
      
      guard let user = result?.user else { return }
      self.userSession = user
      self.fetchUser()
    }
  }
  
  func register(withEmail email: String, password: String,
                image: UIImage?, fullname: String, username: String) {
    guard let image = image else { return }
    
    ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        if let error = error {
          print(error.localizedDescription)
          return
        }
        
        guard let user = result?.user else { return }
        print("Successfully registered user... ")
        
        let data = ["email": email,
                    "username": username,
                    "fullname": fullname,
                    "profileImageUrl": imageUrl,
                    "uid": user.uid]
        
//        Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
        COLLECTION_USERS.document(user.uid).setData(data) { _ in
          print("Successfully uploaded user data...")
          self.userSession = user
          self.fetchUser()
        }
      }
    }
  }
  
  func signout() {
    self.userSession = nil
    try? Auth.auth().signOut()
  }
  
  func resetPassword() {
    
  }
  
  func fetchUser() {
    guard let uid = userSession?.uid else { return }
//    Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in
    COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
//      print(snapshot?.data())
      guard let user = try? snapshot?.data(as: User.self) else { return }
//      print("DEBUG: User is \(user)")
      self.currentUser = user
    }
  }
}
