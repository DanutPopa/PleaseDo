//
//  LoginVM.swift
//  PleaseDo
//
//  Created by Danut Popa on 23.10.2025.
//

import Foundation
import Combine

final class LoginVM: ObservableObject {
    private let auth = LoginManager()
    
    enum Status {
        case unknown, loggedIn, loggedOut
    }
    
    @Published var loginStatus: Status = .unknown
    
    @Published var isLogginIn = true {
        didSet {
            if isLogginIn {
                titleText = "Login"
                toggleText = "Don't have an account?"
                prompt = "Sign up here"
            } else {
                titleText = "Sign up"
                toggleText = "Already have an account?"
                prompt = "Login here"
            }
        }
    }
    
    @Published var titleText = "Login"
    @Published var toggleText = "Don't have an account?"
    @Published var prompt = "Sign up here"
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var newEmail = ""
    @Published var newPassword = ""
    @Published var firstName = ""
    @Published var lastName = ""
    
    init() {
        auth.delegate = self
    }
    
    func didTapLoginButton() {
        if isLogginIn {
            auth.signIn(email, password)
        } else {
            auth.signUP(firstName, lastName: lastName, newEmail, newPassword)
        }
    }
    
    func signOut() {
        auth.signOut()
    }
}

extension LoginVM: LoginManagerDelegate {
    func authStateDidChange(isLoggedIn: Bool) {
        loginStatus = isLoggedIn ? .loggedIn : .loggedOut
    }
}
