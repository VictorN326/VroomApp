//
//  AuthenticationViewModel.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import Combine
class AuthenticationViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    private let service = userService.shared
    private var cancellables = Set<AnyCancellable>()
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
            DispatchQueue.main.async {
                self.userSession = result?.user
                self.fetchUser() 
            }
        }
    }
    
    func registerUser(withEmail email:String, password: String, fullName: String) {
        guard let location = LocationManager.shared.userLocation else {return}
//        print("DEBUG: Location is \(location)")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign up with error \(error.localizedDescription)")
                return
            }
//            print("DEBUG: Registered user successfully")
//            print("DEBUG User id \(result?.user.uid)")
            guard let firebaseUser = result?.user else {return}
            DispatchQueue.main.async {
                self.userSession = firebaseUser
                let user = User(fullName: fullName, email: email, uid: firebaseUser.uid, coordinates: GeoPoint(latitude: location.latitude, longitude: location.longitude), accountType: .driver)
                self.currentUser = user
                guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
                
                Firestore.firestore().collection("users").document(firebaseUser.uid).setData(encodedUser)
            }

        }
    }
    func refreshUser() {
        fetchUser()
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            DispatchQueue.main.async {
                self.userSession = nil
                self.currentUser = nil // Clear the currentUser as well
            }
//            print("DEBUG: Did sign out with firebase")
        } catch let error {
            print("DEBUGL Failed to sign out with error: \(error.localizedDescription)")
        }
    }
    
    // Get user information from Firebase
    func fetchUser() {
        service.$user
            .sink { user in
                self.currentUser = user
            }
            .store(in: &cancellables)
        }
    }
    

