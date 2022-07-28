//
//  ContentView.swift
//  Drawing
//
//  Created by Badran on 19/07/2022.
//

import SwiftUI

struct Arrow: Shape {
    var insetAmount = 0.0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        
        path.addLine(to: CGPoint(x: rect.width / 4, y: rect.height / 4))
        path.addLine(to: CGPoint(x: rect.width / 2 - rect.width / 10, y: rect.height / 4))
        path.addLine(to: CGPoint(x: rect.width / 2 - rect.width / 10, y: (rect.height / 4) * 2))
        path.addLine(to: CGPoint(x: rect.width / 2 + rect.width / 10, y: (rect.height / 4) * 2))
        path.addLine(to: CGPoint(x: rect.width / 2 + rect.width / 10, y: rect.height / 4))
        path.addLine(to: CGPoint(x: rect.width - rect.width / 4, y: rect.height / 4))
        path.addLine(to: CGPoint(x: rect.width / 2, y: 0))

        return path
    }
}

struct ContentView: View {
    @State private var lineWidth = 1.0
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .padding(.top)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                lineWidth = Double.random(in: 1...50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
