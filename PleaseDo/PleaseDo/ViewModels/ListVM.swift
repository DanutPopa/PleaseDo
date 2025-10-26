//
//  ListVM.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import Foundation
import Combine

final class ListVM: ObservableObject {
    @Published var todoItems: [Item] = []
    @Published var inProgressItems: [Item] = []
    @Published var doneItems: [Item] = []
    @Published var unknown: [Item] = []
    
    init() {
        ItemsManager.shared.delegate = self
    }
    
    func fetchItems() {
        ItemsManager.shared.fetchItems()
    }
}

extension ListVM: ItemsManagerDelegate {
    func didFetchItems(_ items: [Status: [Item]]) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            for status in items.keys {
                switch status {
                case .todo:
                    todoItems = items[status] ?? []
                case .inProgress:
                    inProgressItems = items[status] ?? []
                case .done:
                    doneItems = items[status] ?? []
                case .unknown:
                    continue
                }
            }
        }
    }
    
    func didAddItem(_ item: Item) {
        
    }
    
    func didUpdateItem(_ item: Item) {
        
    }
    
    func didDeleteItem(_ item: Item) {
        
    }
}
