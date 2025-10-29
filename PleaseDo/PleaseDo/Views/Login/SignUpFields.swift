//
//  SignUpFields.swift
//  PleaseDo
//
//  Created by Danut Popa on 22.10.2025.
//

import SwiftUI

struct SignUpFields: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var password: String
    
    enum Field: Hashable {
        case firstName, lastName, email, password
    }
    
    @FocusState private var isKeyboardFocused: Field?
    
    var body: some View {
        VStack(spacing: 12) {
            RegularTextField(placeholder: "First name", text: $firstName)
                .focused($isKeyboardFocused, equals: .firstName)
            
            RegularTextField(placeholder: "Last name", text: $lastName)
                .focused($isKeyboardFocused, equals: .lastName)
            
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
                    case .firstName:
                        firstName = ""
                    case .lastName:
                        lastName = ""
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

#Preview {
    SignUpFields(firstName: .constant(""), lastName: .constant(""), email: .constant(""), password: .constant(""))
}
