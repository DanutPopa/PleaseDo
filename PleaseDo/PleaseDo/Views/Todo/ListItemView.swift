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
            
            Image(systemName: "circle")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: height * 0.45)
                .foregroundStyle(.blue)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListItemView(item: .example, height: 100)
}
