//
//  MultiplicationTable.swift
//  Edutainment
//
//  Created by Thomas Williams on 2/28/24.
//

import SwiftUI
import Foundation

struct MultiplicationGameView: View {
    @Binding var multiplicationTable: Int
    @Binding var score: Int
    @Binding var questionNumber: Int
    @Binding var numberOfQuestion: Int
    @Binding var difficulty: String
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("SCORE: \(score)")
                    Spacer()
                    Text("QUESTION \(questionNumber) / \(numberOfQuestion)")
                }
                .padding()
                .font(.title2)
                
                Spacer()
                
                VStack {
                    Text("\(multiplicationTable + 2) ✖️ \(2) 🟰")
                        .font(.largeTitle)
                    Button {
                        print("Answer 1 selected")
                    } label: {
                        Text("Answer 1")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button {
                        print("Answer 2 selected")
                    } label: {
                        Text("Answer 2")
                    }
                    .buttonStyle(.borderedProminent)

                    
                    Button {
                        print("Answer 3 selected")
                    } label: {
                        Text("Answer 3")
                    }
                    .buttonStyle(.borderedProminent)

                }
                
                Spacer()
            }
            .navigationTitle("Multiply✖️")
        }
    }
    
    func createQuestion() {
        
    }
}

