//
//  Habits.swift
//  HabitTracker
//
//  Created by Badran on 29/07/2022.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]()
    
    init() {
        items = [
            HabitItem(title: "Anfal", description: "Une femme venant de la ville de Biskra. Ville surnommée « la porte du désert » et fournit le monde entier en dattes"),
            HabitItem(title: "Badran", description: "Ses initiales le résument trés bien: « B.G »"),
            HabitItem(title: "Maryam", description: "9️⃣🤰🚫💥🥰")
        ]
    }
}
