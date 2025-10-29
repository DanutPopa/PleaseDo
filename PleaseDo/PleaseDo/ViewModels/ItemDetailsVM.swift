//
//  ItemDetailsVM.swift
//  PleaseDo
//
//  Created by Danut Popa on 28.10.2025.
//

import Foundation
import Combine

final class ItemDetailsVM: ObservableObject {
    @Published var initialItem = Item.empty()
    @Published var updatedItem = Item.example
    @Published var didUpdateItem = false
    @Published var updateItemError = false
    
    func updateItem() {
        Task {
            do {
                try await ItemsManager.shared.save(updatedItem)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    didUpdateItem = true
                }
            } catch {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    updateItemError = true
                }
            }
        }
    }
}
