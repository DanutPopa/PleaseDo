//
//  ItemDetailsView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct ItemDetailsView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text(item.title)
            
            Text(item.description)
            
            Text(item.status.rawValue)
            
            Text(item.priority.rawValue)
        }
    }
}

#Preview {
    ItemDetailsView(item: .example)
}
