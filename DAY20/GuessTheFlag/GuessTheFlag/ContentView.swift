//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Badran on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
                
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
//            Button("Delete", role: .destructive) { }
//            Button("Cancel", role: .cancel) { }
//            Button("OK") { }
            
        } message: {
            Text("Please read this.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
