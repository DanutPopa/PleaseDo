//
//  LoginView.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct LoginView: View {
    @State private var text = "Don't have an account?"
    @State private var prompt = "Sign up here"
    @State private var isLogginIn = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            LoginFields()
            
            HStack {
                Spacer()
                
                LoginButton(title: "Login") {
                    print("Login button tapped")
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            TogglePromptView(text: $text, prompt: $prompt, isLoggingIn: $isLogginIn)
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
