//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Thomas Williams on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var gameOver = false
    @State private var numberOfAttempts = 0
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                Text("Guess the Flag")
                       .font(.largeTitle.weight(.bold))
                       .foregroundStyle(.white)
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))

                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    
                    } label: {
                        Image(countries[number])
                            .clipShape(.capsule)
                            .shadow(radius: 5)
                    }
                    
                }
                Text("Current Score: \(userScore)")
                    .font(.body.weight(.bold))
                    .foregroundStyle(.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
                .foregroundStyle(.secondary)
                    .font(.title.bold())
        }
        .alert("Game is Over", isPresented: $gameOver) {
            Button("Start Over", action: resetGame)
        } message: {
            Text("Final Score \(userScore) / \(numberOfAttempts)")
                .foregroundStyle(.secondary)
                    .font(.title.bold())
        }
        
        
        
    }
    
    func flagTapped(_ number: Int) {
        numberOfAttempts += 1
        if number == correctAnswer {
            scoreTitle = "Correct"
            userScore += 1
            
            if(numberOfAttempts == 8) {
                gameOver = true
            }

        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
        
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        userScore = 0
        numberOfAttempts = 0
    }
}

#Preview {
    ContentView()
}