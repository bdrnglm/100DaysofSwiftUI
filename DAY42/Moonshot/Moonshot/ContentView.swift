//
//  ContentView.swift
//  Moonshot
//
//  Created by Badran on 17/07/2022.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showingGrid = false
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    withAnimation {
                        GridLayout(missions: missions, astronauts: astronauts)
                    }
                } else {
                    withAnimation {
                        ListLayout(missions: missions, astronauts: astronauts)
                    }
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Toggle Layout") {
                    showingGrid.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
