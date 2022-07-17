//
//  ContentView.swift
//  Moonshot
//
//  Created by Badran on 17/07/2022.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView: View {
    var body: some View {
        let layout = [
            GridItem(.adaptive(minimum: 80, maximum: 120))
//            GridItem(.fixed(80)),
//            GridItem(.fixed(80)),
//            GridItem(.fixed(80))
        ]
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
//        ScrollView {
//            LazyVGrid(columns: layout) {
                ForEach(0 ..< 1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
