//
//  HomeView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var vm = ListVM()
    @State private var path: [NavPath] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItems)
                    
                    ListView(title: "In Progress", items: $vm.inProgressItems)
                    
                    ListView(title: "Done", items: $vm.doneItems)
                }
                .tabViewStyle(.page)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
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
            .navigationDestination(for: NavPath.self, destination: { path in
                switch path {
                case .newItem:
                    NewItemView()
                case .details(let item):
                    ItemDetailsView(item: item)
                }
            })
            
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
    }
}
