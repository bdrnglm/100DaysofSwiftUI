//
//  UserDetailView.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: CachedUser
//    let user: User
    
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
                Group {
                    Text("Information")
                        .font(.title.bold())
                        .underline()
                        .padding(.top)
                    
                    Text("\(user.wrappedRegistered.formatted())")
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
                        Text("\(user.wrappedCompany)")
                    }
                    .padding(.bottom, 1)

                    HStack {
                        Text("e-Mail:")
                            .underline()
                        Text("\(user.wrappedEmail)")
                    }
                    .padding(.bottom, 1)

                    HStack(alignment: .top) {
                        Text("Address:")
                            .underline()
                        Text("\(user.wrappedAddress)")
                    }
                    .padding(.bottom, 1)

                    HStack(alignment: .top) {
                        Text("About:")
                            .underline()
                        Text("\(user.wrappedAbout)")
                    }
                    .padding(.bottom, 1)
                }

                Text("Tags")
                    .font(.title.bold())
                    .padding(.top)

                HStack {
                    ForEach(user.tagArray, id: \.self) { tag in
                        Text(tag)
                    }
                }
                .padding(.bottom, 1)

                Text("Friends (\(user.friendArray.count))")
                    .font(.title.bold())
                    .padding(.top)
              
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.friendArray) { friend in
                            let firstName = friend.wrappedName.components(separatedBy: " ")[0]
                            let lastName = friend.wrappedName.components(separatedBy: " ")[1]

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
        .navigationTitle(user.wrappedName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct UserDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            UserDetailView(user: User(id: UUID(), isActive: true, name: "Badran GUELLIM", age: 32, company: "None", email: "badrane.guellim@live.fr", address: "15 avenue Dolce Farniente", about: "Et ouais fraise", registered: Date.now, tags: ["bg", "oui"], friends: [Friend(id: UUID(), name: "Vas Y"), Friend(id: UUID(), name: "Et Oui")]))
//        }
//    }
//}
