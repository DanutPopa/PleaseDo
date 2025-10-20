//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct NewItemView: View {
    @State private var text = ""
    @State private var description = ""
    @State private var item: Item = .example
    
    var body: some View {
        VStack {
            Spacer()
            
            TitledTextField(title: "Title", placeholder: "What do you need to do ?", text: $text)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $description)
            
            Divider()
            
            StatusMenu(status: $item.status)
            
            Divider()
            
            PriorityMenu(priority: $item.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                print("CTAButton tapped")
            }

        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView()
}
