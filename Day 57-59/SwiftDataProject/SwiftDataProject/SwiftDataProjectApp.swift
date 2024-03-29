//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Thomas Williams on 3/29/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
