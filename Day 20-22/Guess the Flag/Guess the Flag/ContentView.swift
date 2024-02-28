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
    
    @State private var flagClicked = -1
    @State private var rotationAngle: Double = 0.0


    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                CustomTitle(text: "Guess the Flag")
                
                VStack {
                    CustomBody(text: "Tap the flag of")
                    CustomTitle(text:countries[correctAnswer])

                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                        withAnimation {
                            rotationAngle += 360 // Increment rotation angle by 360 degrees
                        }
                    
                    } label: {
                        FlagImage(number)
                    }
                    .rotation3DEffect(.degrees(flagClicked == number ? rotationAngle : 0), axis: (x: 0, y:1, z:0))
                    .animation(flagClicked == number ? .default : nil, value: flagClicked )
                    .opacity((flagClicked == number || flagClicked == -1) ? 1 : 0.25)
                    .animation(.default, value: flagClicked )

                    
                    
                    
                }
                CustomBody(text: "Current Score: \(userScore)")
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
        flagClicked = number
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
        flagClicked = -1
    }
    
    func resetGame() {
        userScore = 0
        numberOfAttempts = 0
    }
    
    func FlagImage(_ number: Int) -> some View {
        Image(countries[number])
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
    
    func CustomTitle(text: String) -> some View {
        Text(text)
               .font(.largeTitle.weight(.bold))
               .foregroundStyle(.white)
    }
    
    func CustomBody(text: String) -> some View {
        Text(text)
            .foregroundColor(.white)
            .font(.subheadline.weight(.heavy))
    }
}

#Preview {
    ContentView()
}
