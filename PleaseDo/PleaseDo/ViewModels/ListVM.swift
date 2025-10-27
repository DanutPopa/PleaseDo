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
        if todoItems.isEmpty && inProgressItems.isEmpty && doneItems.isEmpty {
            ItemsManager.shared.fetchItems()
        }
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
        moveItem(item)
    }
    
    func moveItem(_ item: Item) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch item.status {
            case .todo:
                todoItems.append(item)
            case .inProgress:
                inProgressItems.append(item)
            case .done:
                doneItems.append(item)
            case .unknown:
                break
            }
        }
    }
    
    func didUpdateItem(_ item: Item) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            if let index = todoItems.firstIndex(of: item) {
                if todoItems[index].status == item.status {
                    todoItems[index] = item
                } else {
                    todoItems.remove(at: index)
                    moveItem(item)
                }
            } else if let index = inProgressItems.firstIndex(of: item) {
                if inProgressItems[index].status == item.status {
                    inProgressItems[index] = item
                } else {
                    inProgressItems.remove(at: index)
                    moveItem(item)
                }
            } else if let index = doneItems.firstIndex(of: item) {
                if doneItems[index].status == item.status {
                    doneItems[index] = item
                } else {
                    doneItems.remove(at: index)
                    moveItem(item)
                }
            }
        }
    }
    
    func didDeleteItem(_ item: Item) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            switch item.status {
            case .todo:
                if let index = todoItems.firstIndex(of: item) {
                    todoItems.remove(at: index)
                }
            case .inProgress:
                if let index = inProgressItems.firstIndex(of: item) {
                    inProgressItems.remove(at: index)
                }
            case .done:
                if let index = doneItems.firstIndex(of: item) {
                    doneItems.remove(at: index)
                }
            case .unknown:
                break
            }
        }
    }
}
