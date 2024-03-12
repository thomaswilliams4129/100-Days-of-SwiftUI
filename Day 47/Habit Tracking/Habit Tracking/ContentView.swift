//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Thomas Williams on 3/11/24.
// Keep track of how much they do certain things
// List of all activities they want to track, plus a form to add new activites - a title and description should be enough

import SwiftUI

struct Habit:Identifiable, Encodable, Decodable {
    var id = UUID()
    let title: String
    let description: String
}

@Observable
class Habits {
    var habits = [Habit]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habits = decodedHabits
                return
            }
        }
    }
}


struct ContentView: View {
    @State private var allActivites = Habits()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allActivites.habits) { habit in
                    Text(habit.title)
                }
            }
            .toolbar {
                NavigationLink {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
