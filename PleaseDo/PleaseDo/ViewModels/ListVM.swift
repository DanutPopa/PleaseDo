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
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)
    ]
    @Published var unknown: [Item] = []
    
    func fetchItems() {
        ItemsManager.shared.fetchItems()
    }
}
