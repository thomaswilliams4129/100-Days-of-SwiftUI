//
//  ContentView.swift
//  FriendFace
//
//  Created by Thomas Williams on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
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
            .task {
                await loadData()
            }
            .navigationTitle("Users")
        }
        
        
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodeData = try? JSONDecoder().decode([User].self, from: data) {
                users = decodeData
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
