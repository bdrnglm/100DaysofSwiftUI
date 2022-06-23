//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Badran on 23/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello world!") {
            useRedText.toggle()
        }
        .foregroundStyle(useRedText ? .red : .green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
