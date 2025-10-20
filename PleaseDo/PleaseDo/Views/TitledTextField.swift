//
//  TitledTextField.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct TitledTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.caption2)
                .foregroundColor(.secondary)
            
            TextField(placeholder, text: $text)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TitledTextField(title: "Title", placeholder: "What do you need to do?", text: .constant(""))
}
