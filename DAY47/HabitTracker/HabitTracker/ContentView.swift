//
//  ContentView.swift
//  HabitTracker
//
//  Created by Badran on 29/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.items) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.title2)
                        
                        Spacer()
                        
                        Text(item.description)
                            .font(.caption)
                    }
                }
            }
            .navigationTitle("HabitTracker")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
