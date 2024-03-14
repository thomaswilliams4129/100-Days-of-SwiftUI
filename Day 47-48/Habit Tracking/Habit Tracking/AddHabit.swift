//
//  AddHabit.swift
//  Habit Tracking
//
//  Created by Thomas Williams on 3/11/24.
//

import SwiftUI

struct AddHabit: View {
    @State private var title = ""
    @State private var description = ""
    @Environment(\.dismiss) var dismiss
    
    var allActivites: Habits

    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Habit")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let habit = Habit(title: title, description: description)
                        allActivites.habits.append(habit)
                        
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddHabit(allActivites: Habits())
}
