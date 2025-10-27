//
//  ItemsManager.swift
//  PleaseDo
//
//  Created by Danut Popa on 25.10.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol ItemsManagerDelegate where Self: ListVM {
    func didFetchItems(_ items: [Status: [Item]])
    func didAddItem(_ item: Item)
    func didUpdateItem(_ item: Item)
    func didDeleteItem(_ item: Item)
}

final class ItemsManager {
    static let shared = ItemsManager()
    
    weak var delegate: ItemsManagerDelegate?
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    private var isInitialFetch = true
    
    private var allItems: [Status: Set<Item>] = [
        .todo: [],
        .inProgress: [],
        .done: []
    ]
    
    private init() {}
    
    deinit {
        removeListener()
    }
    
    func removeListener() {
        listener?.remove()
        listener = nil
    }
    
    func fetchItems() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let id = currentUser.uid
        removeListener()
        listener = db.collection("Items").whereField("authorId", isEqualTo: id).addSnapshotListener { [weak self] querySnapshot, error in
                if let error {
                    print("Error fetching documents: \(error)")
                    return
                }
                
                guard let self, let querySnapshot else { return }
                querySnapshot.documentChanges.forEach { [weak self] change in
                    let data = change.document.data()
                    let item = Item(data: data)
                    guard let self else { return }
                    
                    switch change.type {
                    case .added:
                        if isInitialFetch {
                            allItems[item.status]?.insert(item)
                        } else {
                            delegate?.didAddItem(item)
                        }
                    case .modified:
                        delegate?.didUpdateItem(item)
                    case .removed:
                        delegate?.didDeleteItem(item)
                    }
                }
                guard isInitialFetch else { return }
                sortItems()
                isInitialFetch = false
            }
    }
    
    private func sortItems() {
        var sortedItems: [Status: [Item]] = [:]
        
        allItems.keys.forEach { status in
            sortedItems[status] = allItems[status]?.sorted(by: {
                $0.startDate > $1.startDate
            })
        }
        
        delegate?.didFetchItems(sortedItems)
    }
    
    func save(_ item: Item) async throws {
        do {
            try await db.collection("Items").document(item.id).setData(item.toObject())
            print("Document successfully written!")
        } catch {
            print("Error writing document: \(error)")
            throw error
        }
    }
}
