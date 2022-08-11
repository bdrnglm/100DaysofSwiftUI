//
//  UserDetailView.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    let smileys = "😀😃😄😁😆😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩🥳😏😒😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😤😠😡🤬🤯😳🥵🥶😶‍🌫️😱😨😰😥😓🤗🤔🤭🤫🤥😶😐😑😬🙄😯😦😧😮😲🥱😴🤤😪😮‍💨😵😵‍💫🤐🥴🤢🤮🤧😷🤒🤕🤑🤠"

    var smiley: Character {
        Array(smileys).randomElement() ?? "👻"
    }

    var body: some View {
        ScrollView {
            Text(String(smiley))
                .font(.system(size: 150))
            
            Text("\(user.isActive ? "on" : "off")line")
                .foregroundColor(user.isActive ? .green : .secondary)

            VStack(alignment: .leading) {
                Text("Information")
                    .font(.title.bold())
                    .underline()
                    .padding(.top)
                
                Text("\(user.registered.formatted())")
                    .font(.system(size: 12))
                    .padding(.bottom)

                HStack {
                    Text("Age:")
                        .underline()
                    Text("\(user.age)")
                }
                .padding(.bottom, 1)

                HStack {
                    Text("Company:")
                        .underline()
                    Text("\(user.company)")
                }
                .padding(.bottom, 1)

                HStack {
                    Text("e-Mail:")
                        .underline()
                    Text("\(user.email)")
                }
                .padding(.bottom, 1)

                HStack(alignment: .top) {
                    Text("Address:")
                        .underline()
                    Text("\(user.address)")
                }
                .padding(.bottom, 1)

                HStack(alignment: .top) {
                    Text("About:")
                        .underline()
                    Text("\(user.about)")
                }
                .padding(.bottom, 1)

                Text("Friends")
                    .font(.title.bold())
                    .padding(.top)
              
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.friends) { friend in
                            let firstName = friend.name.split(separator: " ")[0]
                            let lastName = friend.name.split(separator: " ")[1]

                            UserView(isActive: false)
                            
                            VStack(alignment: .leading) {
                                Text(firstName)
                                    .foregroundColor(.primary)
                                    .font(.headline)
                                
                                Text(lastName)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.trailing)
                        }
                    }
                }
                .overlay (
                    Rectangle()
                        .strokeBorder()
                )
//                .padding(.horizontal)
            }
            

            Spacer()
        }
        .padding()
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
