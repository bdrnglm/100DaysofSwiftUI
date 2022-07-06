//
//  ContentView.swift
//  iExpense
//
//  Created by Badran on 06/07/2022.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "tapCount")

    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
//            UserDefaults.standard.set(tapCount, forKey: "tapCount")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
