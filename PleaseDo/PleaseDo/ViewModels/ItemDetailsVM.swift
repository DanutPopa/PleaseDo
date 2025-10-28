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
}
