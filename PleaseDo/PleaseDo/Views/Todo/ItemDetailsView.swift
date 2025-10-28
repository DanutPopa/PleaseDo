//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    @StateObject private var vm = ItemDetailsVM()
    
    var body: some View {
        VStack {
            TitledTextField(title: "Title", placeholder: "What do you need to do ?", text: $vm.updatedItem.title)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $vm.updatedItem.description)
            
            Divider()
            
            StatusMenu(status: $vm.updatedItem.status)
            
            Divider()
            
            PriorityMenu(priority: $vm.updatedItem.priority)
            
            Spacer()
            
            if vm.initialItem.isDifferent(comparedTo: vm.updatedItem) {
                CTAButton(title: "Confirm") {
                    print("CTAButton tapped")
                }
            }
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            vm.initialItem = item
            vm.updatedItem = item
        }
    }
}

#Preview {
    NavigationStack {
        ItemDetailsView(item: .example)
    }
}
