//
//  UserDetailView.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("\(user.isActive ? "on" : "off")line")
            Spacer()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User(id: UUID(), isActive: true, name: "Badran GUELLIM", age: 32, company: "None", email: "badrane.guellim@live.fr", address: "15 avenue Dolce Farniente", about: "Et ouais fraise", registered: Date.now, tags: ["bg", "oui"], friends: [Friend(id: UUID(), name: "Vas Y"), Friend(id: UUID(), name: "Et Oui")]))
        }
    }
}
