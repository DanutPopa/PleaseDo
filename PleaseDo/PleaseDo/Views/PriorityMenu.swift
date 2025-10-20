//
//  PriorityMenu.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct PriorityMenu: View {
    @Binding var priority: Priority
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Priority:")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        if priority == .unknown {
                            EmptyView()
                        } else {
                            Text(priority.rawValue)
                        }
                    }
                }
                .pickerStyle(.menu)
            }
            
            Spacer()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PriorityMenu(priority: .constant(.low))
}
