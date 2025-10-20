//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @State private var updatedItem = Item.example
    
    var body: some View {
        VStack {
            TitledTextField(title: "Title", placeholder: "What do you need to do ?", text: $updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $updatedItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                print("CTAButton tapped")
            }
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    NavigationStack {
        ItemDetailsView(item: .example)
    }
}
