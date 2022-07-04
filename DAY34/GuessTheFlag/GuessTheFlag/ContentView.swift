//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Badran on 20/06/2022.
//

import SwiftUI

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .shadow(radius: 10)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var tappedFlag = -1
    
    @State private var score = 0
    
    @State private var showingReset = false
    @State private var round = 0

    @State private var animationAmount = 0.0
    @State private var opacityAmount = 1.0
    @State private var scaleAmount = 1.0

    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .orange, location: 0.3),
                .init(color: .purple, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("GuessTheFlag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(country: countries[number])
                        }
                        .rotation3DEffect(.degrees(tappedFlag == number ? animationAmount : animationAmount * -1), axis: (x: 0, y: 1, z: 0))
                        .opacity(tappedFlag == number ? 1.0 : opacityAmount)
                        .scaleEffect(tappedFlag == number ?  1.0 : scaleAmount)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            if scoreTitle == "Correct" {
                Text("You guessed the correct flag")
            } else {
                let country = tappedFlag != -1 ? countries[tappedFlag] : "None"
                Text("That's the flag of \(country)")
//                Text("That's the flag of \(countries[tappedFlag])")
            }
        }
        .alert("Game Over", isPresented: $showingReset) {
            Button("Restart", action: reset)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        tappedFlag = number
        withAnimation {
            animationAmount += 360
            opacityAmount = 0.25
            scaleAmount = 0.25
        }
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score = score > 0 ? score - 1 : 0
        }
        showingScore = true
        round += 1
    }
    
    func askQuestion() {
        if round >= 8 {
            showingReset = true
        }
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        withAnimation {
            animationAmount = 0
            opacityAmount = 1.0
            scaleAmount = 1.0
        }
        tappedFlag = -1
    }
    
    func reset() {
        score = 0
        round = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
