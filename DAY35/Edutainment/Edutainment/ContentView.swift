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
    @State private var questionAmount = 5
    
    @State private var answer = ""
    
    @FocusState private var answerIsFocused: Bool

    @State private var questionTable = Array(0...20)
    
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
                    .disabled(true)
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
                
                Section {
                    List(0 ..< questionAmount, id: \.self) { ligne in
                        HStack {
                            Text("\(table) x \(questionTable[ligne]) =")
                            TextField("?", text: $answer)
                                .keyboardType(.decimalPad)
                                .focused($answerIsFocused)
                        }
                    }
                }
            }
            .navigationTitle("Edutainment")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        answerIsFocused = false
                        questionTable.shuffle()
                    }
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
