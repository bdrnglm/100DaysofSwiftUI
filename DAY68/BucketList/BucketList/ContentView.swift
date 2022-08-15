//
//  ContentView.swift
//  BucketList
//
//  Created by Badran on 14/08/2022.
//

import SwiftUI

struct User: Identifiable, Comparable {
    var id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.lastName
    }
}

struct ContentView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    
//    ].sorted {
//        $0.firstName < $1.lastName
//    }
    
//    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    var body: some View {
        List(users) { user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
