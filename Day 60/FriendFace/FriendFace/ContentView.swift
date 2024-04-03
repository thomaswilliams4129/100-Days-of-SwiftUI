//
//  ContentView.swift
//  FriendFace
//
//  Created by Thomas Williams on 4/1/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        VStack {
                            Text(user.name)
                                .font(.headline)
                            Text(user.isActive ? "Online" : "Offline")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                if users.count == 0 {
                    await loadData()
                }
            }
        }
    }
    
    func loadData() async {
        // Load and decode the JSON.
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)

            // Add all our data to the context.
            for user in users {
                modelContext.insert(user)
            }

        } catch {
            print("Failed to pre-seed database.")
        }
    }
}

#Preview {
    ContentView()
}
