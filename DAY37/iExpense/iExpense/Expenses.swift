//
//  Expenses.swift
//  iExpense
//
//  Created by Badran on 07/07/2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
