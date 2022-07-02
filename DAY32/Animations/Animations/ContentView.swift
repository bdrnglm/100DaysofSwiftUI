//
//  ContentView.swift
//  Animations
//
//  Created by Badran on 02/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeIn(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmount)
        )
        .onAppear {
            animationAmount = 2
        }

//        .animation(
//            .easeIn(duration: 1)
////            .easeIn(duration: 2)
//                .repeatForever(autoreverses: true),
////                .repeatCount(3, autoreverses: true),
////                .delay(1),
//            value: animationAmount)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
//        .animation(.easeOut, value: animationAmount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
