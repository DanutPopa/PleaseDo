//
//  HomeView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    @State private var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description"),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10)]
    @State private var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description"),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10)]
    @State private var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description"),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10)
    ]
    
    var body: some View {
        NavigationStack {
            TabView {
                ListView(title: "To Do", items: $todoItems)
                
                ListView(title: "In Progress", items: $inProgressItems)
                
                ListView(title: "Done", items: $doneItems)
            }
            .tabViewStyle(.page)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .navigationDestination(for: String.self, destination: { _ in
                Text("New view here")
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        print("Log out")
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Navigate to new item")
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
