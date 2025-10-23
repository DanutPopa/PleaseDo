//
//  LoginView.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginVM()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            LoginTitleView()
            
            Text(vm.titleText)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal)
            
            if vm.isLogginIn {
                LoginFields(email: $vm.email, password: $vm.password)
            } else {
                SignUpFields(firstName: $vm.firstName, lastName: $vm.lastName, email: $vm.newEmail, password: $vm.newPassword)
            }
            
            HStack {
                Spacer()
                
                LoginButton(title: vm.titleText) {
                    if vm.isLogginIn {
                        print("Login here")
                    } else {
                        vm.signUp()
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            TogglePromptView(text: $vm.toggleText, prompt: $vm.prompt, isLoggingIn: $vm.isLogginIn)
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
