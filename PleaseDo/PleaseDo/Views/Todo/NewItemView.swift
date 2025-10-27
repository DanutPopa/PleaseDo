//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()
    
    var body: some View {
        VStack {
            Spacer()
            
            TitledTextField(title: "Title", placeholder: "What do you need to do ?", text: $vm.newItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $vm.newItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.newItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.newItem.priority)
            
            Spacer()
            
            CTAButton(title: "Confirm") {
                Task {
                    do {
                        try await vm.saveNewItem()
                    } catch {
                        
                    }
                }
            }
            

        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView()
}
