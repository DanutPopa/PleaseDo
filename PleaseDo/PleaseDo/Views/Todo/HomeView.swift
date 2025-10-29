//
//  HomeView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var loginVM: LoginVM
    @StateObject private var vm = ListVM()
    @State private var path: [NavPath] = []
    @State private var showLogout = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                
                TabView {
                    ListView(title: "To Do", items: $vm.todoItems, shouldRedraw: $vm.shouldRedraw)
                    
                    ListView(title: "In Progress", items: $vm.inProgressItems, shouldRedraw: $vm.shouldRedraw)
                    
                    ListView(title: "Done", items: $vm.doneItems, shouldRedraw: $vm.shouldRedraw)
                }
                .tabViewStyle(.page)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        showLogout = true
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
                    NewItemView(path: $path)
                case .details(let item):
                    ItemDetailsView(item: item, path: $path)
                }
            })
            .confirmationDialog("Continue signing out?", isPresented: $showLogout) {
                Button("Confirm", role: .destructive) {
                    loginVM.signOut()
                }
                Button("Cancel", role: .cancel) {
                    
                }
            } message: {
                Text("Continue signing out?")
            }
        }
        .onAppear {
            vm.fetchItems()
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .environmentObject(LoginVM())
    }
}
