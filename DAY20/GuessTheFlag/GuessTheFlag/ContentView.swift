//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Badran on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        Button {
            print("Edit button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
//            Image(systemName: "pencil")
        }
        
//        Button {
//            print("Button was tapped")
//        } label: {
//            Text("Tap me!")
//                .padding()
//                .foregroundColor(.white)
//                .background(.red)
//        }
        
//        VStack {
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
////            Button("Button 3") { }
////                .buttonStyle(.borderedProminent)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//        }
        
//        Button("Delete selection", role: .destructive, action: executeDelete)
        
//        Button("Delete selection", action: executeDelete)

//        Button("Delete selection") {
//            print("Now deleting…")
//        }
        
    }

    func executeDelete() {
        print("Now deleting…")
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
