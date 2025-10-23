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
        // create a user in the firebase database
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error {
                print(error.localizedDescription)
                return
            }
            guard let self, let result else { return }
            currentUser = result.user
            let id = result.user.uid
            Task { [weak self] in
                guard let self else { return }
                do {
                    // set a document for the user using the id as the name of the document
                    try await db.collection("Users").document(id).setData([
                        "email" : email,
                        "firstName" : firstName,
                        "id" : id,
                        "lastName" : lastName
                    ])
                    print("Document successfully written!")
                } catch {
                    print("Error writing document: \(error)")
                }
            }
        }
    }
}
