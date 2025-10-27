//
//  NewItemVM.swift
//  PleaseDo
//
//  Created by Danut Popa on 27.10.2025.
//

import Foundation
import Combine

final class NewItemVM: ObservableObject {
    @Published var newItem = Item.empty()
    
    func saveNewItem() async throws {
        try await ItemsManager.shared.save(newItem)
    }
}
