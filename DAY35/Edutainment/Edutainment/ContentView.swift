//
//  ContentView.swift
//  Edutainment
//
//  Created by Badran on 05/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2
    
    let questionAmounts = [5, 10, 20]
    @State private var questionAmount = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Multiplication tables", selection: $table) {
                        ForEach(2...12, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Multiplication tables to practice")
                }
                
                Section {
                    Picker("Number of questions", selection: $questionAmount) {
                        ForEach(questionAmounts, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Number of questions to be asked")
                }
            }
            .navigationTitle("Edutainment")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
