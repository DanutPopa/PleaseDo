//
//  StatusMenu.swift
//  PleaseDo
//
//  Created by Danut Popa on 20.10.2025.
//

import SwiftUI

struct StatusMenu: View {
    @Binding var status: Status
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Status:")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                
                Picker("Status", selection: $status) {
                    ForEach(Status.allCases, id: \.self) { status in
                        if status == .unknown {
                            EmptyView()
                        } else {
                            Text(status.rawValue)
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
    StatusMenu(status: .constant(.todo))
}
