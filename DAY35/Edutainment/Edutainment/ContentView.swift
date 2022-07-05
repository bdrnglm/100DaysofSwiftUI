//
//  ContentView.swift
//  Edutainment
//
//  Created by Badran on 05/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var table = 2

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Table #\(table)", selection: $table) {
                        ForEach(2...12, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("What multiplication table to practice?")
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
