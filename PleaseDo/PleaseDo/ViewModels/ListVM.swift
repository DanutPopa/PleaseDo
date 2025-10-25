//
//  ListVM.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import Foundation
import Combine

final class ListVM: ObservableObject {
    @Published var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .todo, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .todo, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .inProgress, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .inProgress, priority: .low)
    ]
    @Published var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .done, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .done, priority: .low)
    ]
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
    
    func didAddItem(_ item: Item) {
        <#code#>
    }
    
    func didUpdateItem(_ item: Item) {
        <#code#>
    }
    
    func didDeleteItem(_ item: Item) {
        <#code#>
    }
}
