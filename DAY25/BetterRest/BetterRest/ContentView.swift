//
//  ContentView.swift
//  BetterRest
//
//  Created by Badran on 25/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now

    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
//        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
//            .labelsHidden()
    }
    
//    func exampleDates() {
//        // create a second Date instance set to one day in seconds from now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//
//        // create a range from those two
//        let range = Date.now...tomorrow
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
