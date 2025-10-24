//
//  LoginManager.swift
//  PleaseDo
//
//  Created by Danut Popa on 23.10.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class LoginManager {
    // Fetch login related data to pass to LoginVM
    
    private let db = Firestore.firestore()
    var currentUser: User?
    
    func signUP(_ firstName: String, lastName: String, _ email: String, _ password: String) {
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                currentUser = result.user
                let id = result.user.uid
                try await db.collection("Users").document(id).setData([
                    "email": email,
                    "firstName" : firstName,
                    "id" : id,
                    "lastName" : lastName
                ])
                print("Document successfully written!")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
