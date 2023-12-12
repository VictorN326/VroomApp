//
//  AuthenticationViewModel.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    func signIn(withEmail email:String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if let error = error {
                print("DEBUG: FAiled to sign in with error \(error.localizedDescription)")
            }
//            print("DEBUG: Signed user in successfully")
//            print("DEBUG: User id \(result?.user.uid)")
            self.userSession = result?.user
        }
    }
    
    func registerUser(withEmail email:String, password: String, fullName: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
//            print("DEBUG: Registered user successfully")
//            print("DEBUG User id \(result?.user.uid)")
            guard let firebaseUser = result?.user else {return}
            self.userSession = firebaseUser
            
            let user = User(fullName: fullName, email: email, uid: firebaseUser.uid)
            guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
            
            Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
//            print("DEBUG: Did sign out with firebase")
        } catch let error {
            print("DEBUGL Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    // Get user information from Firebase
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to get Document from Firestore with error \(error.localizedDescription)")
                return
            }
            guard let snapshot = snapshot else {return}
//            print("DEBUG: User data is \(data)")
            guard let user = try? snapshot.data(as: User.self) else {return}
            
            self.currentUser = user
//            print("DEBUG: User is \(user.fullName)")
//            print("DEBUG: Email is \(user.email)")
        }
    }
    
}
