//
//  HomeViewModel.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/13/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import Combine
class HomeViewModel: ObservableObject {
    @Published var drivers = [User] ()
    private var service = userService.shared
//    var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    init() {
        fetchUser()
    }
    
    func fetchDriver() {
        Firestore.firestore().collection("users").whereField("accountType", isEqualTo: AccountType.driver.rawValue)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let drivers =  documents.compactMap({try? $0.data(as: User.self)})
                self.drivers = drivers
            }
    }
    
    func fetchUser() {
        service.$user
            .sink { user in
                guard let user = user else {return}
//                self.currentUser = user
                guard user.accountType == .passenger else {return}
                self.fetchDriver()
            }
            .store(in: &cancellables)
        }
    }

