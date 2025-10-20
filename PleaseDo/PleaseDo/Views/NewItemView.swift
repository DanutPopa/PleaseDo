//
//  NewItemView.swift
//  PleaseDo
//
//  Created by Danut Popa on 19.10.2025.
//

import SwiftUI

struct NewItemView: View {
    @State private var text = ""
    @State private var description = ""
    
    var body: some View {
        VStack {
            TitledTextField(title: "Title", placeholder: "What do you need to do ?", text: $text)
            
            Divider()
            
            TitledTextField(title: "Description", placeholder: "Add a brief description", text: $description)
            
            Divider()
        }
    }
}

#Preview {
    NewItemView()
}
