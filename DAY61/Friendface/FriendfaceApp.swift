//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
