//
//  HabitView.swift
//  HabitTracker
//
//  Created by Badran on 30/07/2022.
//

import SwiftUI

struct HabitView: View {
    let title: String
    let description: String
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text(description)
            }
        }
        .navigationTitle(title)
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(title: "Allah", description: "AstaghfirAllah al 3adhim...")
    }
}
