//
//  ContentView.swift
//  Drawing
//
//  Created by Badran on 19/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
            Image("Patrick")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)

//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
////                    .fill(.red)
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
////                    .fill(.green)
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
////                    .fill(.blue)
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//            }
//            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
        
//        ZStack {
//            Image("Patrick")
////                .colorMultiply(.red)
//
////            Rectangle()
////                .fill(.red)
////                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 500)
//        .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
