//
//  HomeView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var path: [NavPath] = []
    @State private var todoItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)]
    @State private var inProgressItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)]
    @State private var doneItems: [Item] = [
        Item(id: "abc123", authorId: "John Doe", title: "First item", description: "First description", status: .done, priority: .unknown),
        Item(id: "123abc", authorId: "John Doe", title: "Second item", description: "Second description", startDate: .now + 5, status: .inProgress, priority: .high),
        Item(id: "789xyz", authorId: "John Doe", title: "Third item", description: "Third description", startDate: .now + 10, status: .todo, priority: .low)]
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $todoItems)
                    
                    ListView(title: "In Progress", items: $inProgressItems)
                    
                    ListView(title: "Done", items: $doneItems)
                }
                .tabViewStyle(.page)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .navigationDestination(for: NavPath.self, destination: { path in
                switch path {
                case .newItem:
                    Text("New item view here")
                case .details(let item):
                    Text(item.title)
                }
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
                        path.append(.newItem)
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
