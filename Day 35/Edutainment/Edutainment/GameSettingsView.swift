//
//  ContentView.swift
//  Edutainment
//
//  Created by Thomas Williams on 2/28/24.
//

import SwiftUI

struct GameSettingsView: View {
    @State private var multiplicationTable = 1
    @State private var score = 0
    @State private var questionNumber = 1
    @State private var numberOfQuestion = 5
    @State private var difficutly = "Normal"
    @State private var levels = ["Easy", "Normal", "Hard"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Pick your multiplication table") {
                        Picker("Multiplication Table", selection: $multiplicationTable) {
                            ForEach(2..<13) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Section {
                            Stepper("\(numberOfQuestion) questions", value: $numberOfQuestion, in: 1...10)
                        }
                        
                        Picker("Difficulty", selection: $difficutly) {
                            ForEach(levels, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    
                    NavigationLink {
                        MultiplicationGameView(multiplicationTable: $multiplicationTable, score: $score, questionNumber: $questionNumber, numberOfQuestion: $numberOfQuestion, difficulty: $difficutly)
                    } label: {
                        Text("START")
                    }
                }
                
                
            }
            .navigationTitle("GAME SETUP")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    GameSettingsView()
}
