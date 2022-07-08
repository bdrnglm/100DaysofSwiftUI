//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Badran on 07/07/2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
