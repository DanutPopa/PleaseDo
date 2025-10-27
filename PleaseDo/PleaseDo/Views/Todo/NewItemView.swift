//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct NewItemView: View {
    @StateObject private var vm = NewItemVM()
    @Binding var path: [NavPath]
    
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
                vm.saveNewItem()
            }
            .alert("Alert", isPresented: $vm.saveItemError) {
                Button("Dismiss", role: .cancel) {}
            } message: {
                Text("Error saving new item.")
            }
            .alert("Success!", isPresented: $vm.didSaveItem) {
                Button("Dismiss", role: .cancel) {
                    path.removeLast()
                }
            } message: {
                Text("New item saved succesfully!")
            }

        }
        .padding(.horizontal)
    }
}

#Preview {
    NewItemView(path: .constant([]))
}
