//
//  SignUpFields.swift
//  PleaseDo
//
//  Created by Danut Popa on 22.10.2025.
//

import SwiftUI

struct SignUpFields: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 12) {
            RegularTextField(placeholder: "First name", text: $firstName)
            
            RegularTextField(placeholder: "Last name", text: $lastName)
            
            EmailTextField(placeholder: "user@email.com", text: $email)

            PasswordField(placeholder: "password", text: $password)
        }
        .padding(.horizontal)
        .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
    }
}

#Preview {
    SignUpFields()
}
