//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Badran on 24/06/2022.
//

import SwiftUI

struct ContentView: View {
    let moves = ["✊", "✋", "✌️"]
    
    @State private var randomMove = Int.random(in: 0 ..< 3)
    @State private var shouldWin = Bool.random()
    @State private var move = "✊"
    
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("You have to")
                    .font(.title)
                
                Text(shouldWin ? "WIN" : "LOSE")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(shouldWin ? .green : .red)
//                    .background(.black)

                Text("against")
                    .font(.title)
                
                Text(move)
                    .font(.system(size: 75))
                    .padding()
                
                Spacer()
                
                HStack {
                    ForEach(moves, id: \.self) {
                        Button($0) {}
                            .font(.system(size: 50))
                            .padding()
                    }
                }
                
                Spacer()
            }
            .padding()
        }
//        VStack {
//            Spacer()
//
//            Text(moves[randomMove])
//                .font(.largeTitle)
//
//            Spacer()
//
//            Text("You have to")
//            Text(shouldWin ? "WIN" : "LOSE")
//                .font(.title)
//
//            Spacer()
//
//            HStack {
//                ForEach(moves, id: \.self) {
//                    Button($0) {}
//                }
//            }
//
////            Picker("Rock, Paper, Scissors moves", selection: $move) {
////                ForEach(moves, id: \.self) {
////                    Text($0)
////                }
////            }
////            .pickerStyle(.segmented)
//
//            Spacer()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
