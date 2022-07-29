//
//  ContentView.swift
//  HabitTracking
//
//  Created by Badran on 29/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(habits.items) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.title2)
                            
                            Spacer()
                            
                            Text(item.description)
                                .font(.caption)
                        }
                    }
                } header: {
                    Text("Habits")
                }
            }
            .navigationTitle("HabitTracker")
            .toolbar {
                Button {
                    showingAddHabit = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddHabitView(habits: habits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
