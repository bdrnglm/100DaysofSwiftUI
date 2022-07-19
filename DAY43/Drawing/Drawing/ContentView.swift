//
//  ContentView.swift
//  Drawing
//
//  Created by Badran on 19/07/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.closeSubpath()
        }
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
//        .stroke(.blue, lineWidth: 10)
//        .fill(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
