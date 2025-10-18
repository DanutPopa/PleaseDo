//
//  ListView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct ListView: View {
    let title: String
    
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
            
            List {
                ForEach(1..<4) { index in
                    Text("Item \(index)")
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ListView(title: "To Do")
}
