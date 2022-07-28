//
//  ContentView.swift
//  Drawing
//
//  Created by Badran on 19/07/2022.
//

import SwiftUI

struct Arrow: Shape {
    let size: CGSize

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: size.width / 2, y: 0))
        path.addLine(to: CGPoint(x: size.width / 4, y: size.height / 4))
        path.addLine(to: CGPoint(x: size.width - size.width / 4, y: size.height / 4))
        path.addLine(to: CGPoint(x: size.width / 2, y: 0))
        
        path.move(to: CGPoint(x: size.width / 2 - size.width / 10, y: size.height / 4))
        path.addLine(to: CGPoint(x: size.width / 2 - size.width / 10, y: (size.height / 4) * 2))
        path.addLine(to: CGPoint(x: size.width / 2 + size.width / 10, y: (size.height / 4) * 2))
        path.addLine(to: CGPoint(x: size.width / 2 + size.width / 10, y: size.height / 4))

        return path
    }
}

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Arrow(size: geometry.size)
                    .padding(.top)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
