//
//  NewItemVM.swift
//  PleaseDo
//
//  Created by Danut Popa on 27.10.2025.
//

import Foundation
import Combine
import FirebaseAuth

final class NewItemVM: ObservableObject {
    @Published var newItem = Item.empty()
    @Published var saveItemError = false
    @Published var didSaveItem = false
    
    init() {
        guard let user = Auth.auth().currentUser else { return }
        newItem = Item(
            id: UUID().uuidString,
            authorId: user.uid,
            title: "",
            description: "",
            status: .todo,
            priority: .low)
    }
    
    func saveNewItem() {
        Task {
            do {
                try await ItemsManager.shared.save(newItem)
                didSaveItem = true
            } catch {
                saveItemError = true
            }
        }
    }
    
    
}
