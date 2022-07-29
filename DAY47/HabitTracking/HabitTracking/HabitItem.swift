//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Badran on 29/07/2022.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
}
