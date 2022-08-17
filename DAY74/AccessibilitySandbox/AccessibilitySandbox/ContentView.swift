//
//  ContentView.swift
//  AccessibilitySandbox
//
//  Created by Badran on 17/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement()
//        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
//        .accessibilityElement(children: .combine)
        
//        Image(decorative: "character")
//            .accessibilityHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
