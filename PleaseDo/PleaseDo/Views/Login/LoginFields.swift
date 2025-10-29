//
//  LoginFields.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct LoginFields: View {
    @Binding var email: String
    @Binding var password: String
    
    enum Field: Hashable {
        case email, password
    }
    @FocusState private var isKeyboardFocused: Field?
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)
                .focused($isKeyboardFocused, equals: .email)

            PasswordField(placeholder: "password", text: $password)
                .focused($isKeyboardFocused, equals: .password)
        }
        .padding(.horizontal)
        .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Cancel") {
                    guard let isKeyboardFocused else { return }
                    switch isKeyboardFocused {
                    case .email:
                        email = ""
                    case .password:
                        password = ""
                    }
                    self.isKeyboardFocused = nil
                }
                
                Button("Done") {
                    isKeyboardFocused = nil
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginFields(email: .constant(""), password: .constant(""))
}
