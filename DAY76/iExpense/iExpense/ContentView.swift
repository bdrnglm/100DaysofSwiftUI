//
//  ContentView.swift
//  iExpense
//
//  Created by Badran on 06/07/2022.
//

import SwiftUI

struct ColorPicker: ViewModifier {
    let value: Double
    
    func body(content: Content) -> some View {
        var color: Color {
            if value >= 100 {
                return Color.red
            } else if value >= 10 {
                return Color.orange
            } else {
                return Color.green
            }
        }
        
        return content
            .foregroundColor(color)
    }
}

extension View {
    func amountColor(amount: Double) -> some View {
        modifier(ColorPicker(value: amount))
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                    Section {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                    }
            
                                    Spacer()
            
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .amountColor(amount: item.amount)
                                }
                                .accessibilityElement()
                                .accessibilityLabel("\(item.name), \(item.amount.formatted(currency(code: "USD")))")
                                .accessibilityHint(item.type)
                            }
                        }
                        .onDelete(perform: removeItems)
                    } header: {
                        Text("Business")
                    }

                    Section {
                        ForEach(expenses.items) { item in
                            if item.type == "Personal" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                    }
            
                                    Spacer()
            
                                    Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                        .amountColor(amount: item.amount)
                                }
                                .accessibilityElement()
                                .accessibilityLabel("\(item.name), \(item.amount.formatted(currency(code: "USD")))")
                                .accessibilityHint(item.type)
                            }
                        }
                        .onDelete(perform: removeItems)
                    } header: {
                        Text("Personal")
                    }
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
