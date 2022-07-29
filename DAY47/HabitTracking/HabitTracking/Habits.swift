//
//  Habits.swift
//  HabitTracking
//
//  Created by Badran on 29/07/2022.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]()

    init() {
        items = [
            HabitItem(title: "HackingWithSwift", description: "iOS dev"),
            HabitItem(title: "The Odin Project", description: "Full Stack JS"),
            HabitItem(title: "CS???", description: "iOS dev as well")
        ]
    }
}
