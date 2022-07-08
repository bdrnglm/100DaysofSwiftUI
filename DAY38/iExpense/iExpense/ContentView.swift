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
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            .amountColor(amount: item.amount)
                    }
                }
                .onDelete(perform: removeItems)
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
