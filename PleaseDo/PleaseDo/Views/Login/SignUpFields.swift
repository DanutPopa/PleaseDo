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
    SignUpFields(firstName: .constant(""), lastName: .constant(""), email: .constant(""), password: .constant(""))
}
