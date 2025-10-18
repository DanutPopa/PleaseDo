//
//  ListView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct ListView: View {
    let title: String
    @Binding var items: [Item]
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 32)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.orange)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                        }
                }
                .padding([.horizontal, .top])
            
            List($items) { $item in
                
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do", items: .constant([
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description"),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10)
        ]))
}
