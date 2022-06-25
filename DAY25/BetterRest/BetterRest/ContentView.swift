//
//  ContentView.swift
//  BetterRest
//
//  Created by Badran on 25/06/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .omitted))
//        Text(Date.now.formatted(date: .long, time: .shortened))
//        Text(Date.now, format: .dateTime.hour().minute().second().day().month().year())
//        Text(Date.now, format: .dateTime.hour().minute())
    }

    
    
    func trivialExemple() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? Date.now

//        let now = Date.now
//        let tomorrow = Date.now.addingTimeInterval(86400)
//        let range = now...tomorrow
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
