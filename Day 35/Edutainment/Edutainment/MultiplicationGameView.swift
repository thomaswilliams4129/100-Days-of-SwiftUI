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
    @State private var questionSet = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    @State private var timesNum = 1
    @State private var correctAnswer = 1
    
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
                    Text("\(multiplicationTable + 2) ✖️ \(timesNum) 🟰")
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
            .onAppear(perform: startGame)
        }
    }
    
    func startGame() {
        var index = Int.random(in: 0...20)
        timesNum = questionSet[index]
    }
}

