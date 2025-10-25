//
//  ItemsManager.swift
//  PleaseDo
//
//  Created by Danut Popa on 25.10.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class ItemsManager {
    static let shared = ItemsManager()
    private let db = Firestore.firestore()
    
    private init() {}
    
    func fetchItems() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let id = currentUser.uid
        db.collection("Items").whereField("authorId", isEqualTo: id)
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print("Error fetching documents: \(error)")
                    return
                }
                
                guard let querySnapshot else { return }
                
                querySnapshot.documentChanges.forEach { change in
                    let data = change.document.data()
                    let item = Item(data: data)
                    
                    switch change.type {
                    case .added:
                        <#code#>
                    case .modified:
                        <#code#>
                    case .removed:
                        <#code#>
                    }
                }
            }
    }
}
