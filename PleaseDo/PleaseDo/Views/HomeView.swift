//
//  HomeView.swift
//  PleaseDo
//
//  Created by Danut Popa on 18.10.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            TabView {
                ListView(title: "To Do")
                
                ListView(title: "In Progress")
                
                ListView(title: "Done")
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
