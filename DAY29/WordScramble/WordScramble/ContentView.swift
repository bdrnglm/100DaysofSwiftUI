//
//  ContentView.swift
//  WordScramble
//
//  Created by Badran on 29/06/2022.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        List {
            Text("Static Row")

            ForEach(people, id: \.self) {
                Text($0)
            }
            
            Text("Static Row")
        }
        
//        List(people, id: \.self) {
//            Text($0)
//        }

//        List(0 ..< 5) {
//            Text("Dynamic row \($0)")
//            Section("Section 1") {
//                Text("Static Row 1")
//                Text("Static Row 2")
//            }
//
//            Section("Section 2") {
//                ForEach(0 ..< 5) {
//                    Text("Dynamic Row \($0)")
//                }
//            }
//
//            Section("Section 3"){
//                Text("Static Row 3")
//                Text("Static Row 4")
//            }
//        }
//        .listStyle(.grouped)
    }
    
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
