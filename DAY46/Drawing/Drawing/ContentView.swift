//
//  ContentView.swift
//  Drawing
//
//  Created by Badran on 19/07/2022.
//

import SwiftUI

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0 ..< steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

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
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorCycle)
                .frame(width: 300, height: 300)
                
            Slider(value: $colorCycle)
        }
        
//        VStack {
//            Arrow()
//                .stroke(.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
//                .padding(.top)
//        }
//        .contentShape(Rectangle())
//        .onTapGesture {
//            withAnimation {
//                lineWidth = Double.random(in: 1...50)
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
