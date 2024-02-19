//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Thomas Williams on 2/18/24.
//

import SwiftUI

struct ContentView: View {
    
    // rock, paper, scissors
    let moves = ["✂️", "🪨", "📄"]
    let winningMoves = ["🪨", "📄", "✂️"]
    
    @State private var appsChoice = Int.random(in: 0...2)
    @State private var shouldWin = true
    @State private var result = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var numberOfAttempts = 0
    @State private var gameOver = false


    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Text(shouldWin ? "Beat" : "Lose")
                    .font(.system(size: 70))
                Text(moves[appsChoice])
                    .font(.system(size: 70))
                
                Spacer()
                
                HStack {
                    
                    ForEach(0..<3) { number in
                        Button {
                            scoreTitle = playRockPaperScissors(playerChoice: number)
                        } label: {
                            Text(winningMoves[number])
                        }
                        .buttonStyle()
                        
                    }
                }
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: nextRound)
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
                
                Spacer()
                
                Text("Current Score: \(userScore)")
            }
            .navigationTitle("ROCK-PAPER-SCISSORS")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func playRockPaperScissors(playerChoice: Int) -> String {
        showingScore = true
        numberOfAttempts += 1
        
        if(shouldWin) {
            if(numberOfAttempts == 10) {
                gameOver = true
                showingScore = false
            }
            
            if(playerChoice == appsChoice) {
                userScore += 1
                return "Correct"
            } else {
                userScore -= 1
                return "Wrong"
            }
        } else {
            if(numberOfAttempts == 10) {
                gameOver = true
                showingScore = false
            }
            
            if(playerChoice != appsChoice) {
                userScore += 1
                return "Correct"
            } else {
                userScore -= 1
                return "Wrong"
            }
        }
    }

    
    func nextRound() {
        appsChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        appsChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        
        userScore = 0
        numberOfAttempts = 0
    }

}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 70))
            .padding()
            .background(.primary)
            .clipShape(Capsule())
            .foregroundColor(.primary)
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonStyle())
    }
}




#Preview {
    ContentView()
}
