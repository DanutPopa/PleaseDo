//
//  LoginFields.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct LoginFields: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)

            PasswordField(placeholder: "password", text: $password)
        }
        .padding(.horizontal)
        .shadow(color: .gray, radius: 4, x: 1, y: 2.5)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    LoginFields()
}
