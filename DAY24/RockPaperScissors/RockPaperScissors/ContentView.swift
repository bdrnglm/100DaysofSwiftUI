//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Badran on 24/06/2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊", "✋", "✌️"]
    let wMoves = ["✋", "✌️", "✊"]
    let lMoves = ["✌️", "✊", "✋"]

    @State private var randomMove = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    @State private var move = "✊"
    
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
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
                        .font(.system(size: 50))
                        .padding()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func check(playerMove: String) {
//        let CPUMove = moves[randomMove]

        if shouldWin {
            if playerMove == wMoves[randomMove] {
                print("👍")
            }
        } else {
            if playerMove == lMoves[randomMove] {
                print("👍")
            }
        }
//        if CPUMove == playerMove {
//            print("DRAW")
//        } else if CPUMove == "✊" {
//            if playerMove == "✋" {
//                print("WON")
//            } else {
//                print("LOST")
//            }
//        } else if CPUMove == "✋" {
//            if playerMove == "✌️" {
//                print("WON")
//            } else {
//                print("LOST")
//            }
//        } else if CPUMove == "✌️" {
//            if playerMove == "✊" {
//                print("WON")
//            } else {
//                print("LOST")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
