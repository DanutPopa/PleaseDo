//
//  TogglePromptView.swift
//  PleaseDo
//
//  Created by Danut Popa on 21.10.2025.
//

import SwiftUI

struct TogglePromptView: View {
    @Binding var text: String
    @Binding var prompt: String
    @Binding var isLoggingIn: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(text)
            
            Button(prompt) {
                isLoggingIn.toggle()
            }
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TogglePromptView(text: .constant("Don't have an account?"), prompt: .constant("Sign up here"), isLoggingIn: .constant(true))
}
