//
//  ContentView.swift
//  Bookworm
//
//  Created by Badran on 04/08/2022.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
//    @State var isOn: Bool

    var onColors = [Color.blue, Color.purple]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColors : offColors), startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        PushButton(title: "Remember Me", isOn: $rememberMe)
//        PushButton(title: "Remember Me", isOn: rememberMe)
        Text(rememberMe ? "On" : "Off")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
