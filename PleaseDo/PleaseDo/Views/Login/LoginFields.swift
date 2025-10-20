//
//  LoginFields.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct LoginFields: View {
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 12) {
            EmailTextField(placeholder: "user@email.com", text: $email)
            
            // TextField
        }
        .padding(.horizontal)
    }
}

#Preview {
    LoginFields()
}
