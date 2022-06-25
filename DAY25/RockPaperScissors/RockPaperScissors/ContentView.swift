//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Badran on 24/06/2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊", "✋", "✌️"]
    
    @State private var showingScore = false
    @State private var showingReset = false
    
    @State private var scoreTitle = ""
    
    @State private var randomMove = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    @State private var move = "✊"
    
    @State private var score = 0
    @State private var round = 1
    
    @State private var correctMove = ""

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack {
                Text("Round: \(round)")
                    .font(.largeTitle)

                Spacer()

                Text(shouldWin ? "WIN" : "LOSE")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(shouldWin ? Color(.green) : Color(.red))

                Text("to")
                    .font(.title)
                
                Text(moves[randomMove])
                    .font(.system(size: 75))
                    .padding()
                
                Spacer()
                
                HStack {
                    ForEach(moves, id: \.self) { move in
                        Button(move) {
                            check(playerMove: move)
                        }
                        .font(.system(size: 65))
                        .padding()
                    }
                }
                
                Spacer()
                
                Text("Score: \(score)")
                    .font(.largeTitle)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: prepareGame)
        } message: {
            if scoreTitle == "Correct" {
                Text("You chose the right move!")
            } else {
                Text("\"\(correctMove)\" was the correct move to play")
            }
        }
        .alert("Game Over", isPresented: $showingReset) {
            Button("Restart", action: resetGame)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func check(playerMove: String) {
        
        if shouldWin {
            correctMove = moves[(randomMove + 1) % moves.count]
        } else {
            correctMove = moves[(randomMove + (moves.count - 1)) % moves.count]
        }

        if playerMove == correctMove {
            score += 1
            scoreTitle = "Correct"
        } else {
            score = score > 0 ? score - 1 : 0
            scoreTitle = "Wrong"
        }
        
        showingScore = true
        round += 1
    }
    
    func prepareGame() {
        if round >= 10 {
            showingReset = true
        }
        randomMove = Int.random(in: 0 ..< 3)
        shouldWin = Bool.random()
    }
    
    func resetGame() {
        score = 0
        round = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
