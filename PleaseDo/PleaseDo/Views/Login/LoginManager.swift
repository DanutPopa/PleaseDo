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
    private var handler: AuthStateDidChangeListenerHandle?
    var currentUser: User?
    
    init() {
        setupListener()
    }
    
    deinit {
        removeListener()
    }
    
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
                setupListener()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func signIn(_ email: String, _ password: String) {
        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                currentUser = result.user
                print("Successfully signed in user!")
                setupListener()
            } catch {
                print(error)
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            currentUser = nil
            removeListener()
            print("Successfully signed out user!")
        } catch {
            print(error)
        }
    }
    
    func setupListener() {
        guard handler == nil else { return }
        handler = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            guard let self else { return }
            currentUser = auth.currentUser
        }
    }
    
    func removeListener() {
        guard let handler else { return }
        Auth.auth().removeStateDidChangeListener(handler)
    }
}
