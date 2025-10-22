//
//  RegularTextField.swift
//  PleaseDo
//
//  Created by Danut Popa on 22.10.2025.
//

import SwiftUI

struct RegularTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .textFieldStyle(.roundedBorder)
            .submitLabel(.done)
            .textInputAutocapitalization(.words)
            .keyboardType(.default)
            .background(.clear)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RegularTextField(placeholder: "First name", text: .constant(""))
}
