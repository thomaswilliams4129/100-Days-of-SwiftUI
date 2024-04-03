//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Thomas Williams on 4/1/24.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
