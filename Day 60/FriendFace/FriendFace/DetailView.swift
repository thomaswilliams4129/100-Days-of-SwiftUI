//
//  DetailView.swift
//  FriendFace
//
//  Created by Thomas Williams on 4/1/24.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("About")
                    .font(.title2)
                Text(user.about)
                Text("Friends")
                    .font(.title2)
                List {
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                    }
                }
                .listStyle(.plain)
                
            }
            .navigationTitle(user.name)
            .padding()
        }
    }
}
