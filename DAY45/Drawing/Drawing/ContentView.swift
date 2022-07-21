//
//  ContentView.swift
//  Drawing
//
//  Created by Badran on 19/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Patrick")
                .colorMultiply(.red)

//            Rectangle()
//                .fill(.red)
//                .blendMode(.multiply)
        }
        .frame(width: 400, height: 500)
        .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
