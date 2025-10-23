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
                LoginFields()
            } else {
                SignUpFields()
            }
            
            HStack {
                Spacer()
                
                LoginButton(title: vm.titleText) {
                    print("Login button tapped")
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
