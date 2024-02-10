//
//  ContentView.swift
//  WeSplit
//
//  Created by Thomas Williams on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Herminone", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your Student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}

#Preview {
    ContentView()
}
