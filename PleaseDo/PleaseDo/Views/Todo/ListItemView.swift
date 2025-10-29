//
//  ListItemView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct ListItemView: View {
    let item: Item
    let height: CGFloat
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 3) {
                Text(item.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(item.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: item.priority.img)
                .resizable()
                .scaledToFit()
                .foregroundStyle(item.priority.color)
                .frame(maxHeight: height * 0.45)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item: .empty(), height: 100)
}
