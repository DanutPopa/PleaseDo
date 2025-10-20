//
//  CTAButton.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct CTAButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxHeight: 65)
    }
}

#Preview {
    CTAButton(title: "Confirm") {}
}
