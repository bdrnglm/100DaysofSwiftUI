//
//  ContentView.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                if users.isEmpty {
                    ProgressView()
                } else {
                    ForEach(cachedUsers, id: \.id) { user in
                        let firstName = user.wrappedName.split(separator: " ")[0]
                        let lastName = user.wrappedName.split(separator: " ")[1]

                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            HStack {
                                UserView(isActive: user.isActive)

                                VStack(alignment: .leading) {
                                    Text(firstName)
                                        .foregroundColor(.primary)
                                        .font(.headline)

                                    Text(lastName)
                                        .foregroundColor(.secondary)
                                    
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Friendface")
        }
        .task {
            if users.isEmpty {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
                        
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                await MainActor.run {
                    users = decodedResponse
                    
                    for user in users {
                        let cacheUser = CachedUser(context: moc)
                        cacheUser.id = user.id
                        cacheUser.isActive = user.isActive
                        cacheUser.name = user.name
                        cacheUser.age = Int16(user.age)
                        cacheUser.company = user.company
                        cacheUser.email = user.email
                        cacheUser.address = user.address
                        cacheUser.about = user.about
                        cacheUser.registered = user.registered
                        cacheUser.tags = user.tags.joined(separator: ",")
                        
                        let friendArray = user.friends.map { friend -> CachedFriend in
                            let cachedFriend = CachedFriend(context: moc)
                            cachedFriend.id = friend.id
                            cachedFriend.name = friend.name
                            return cachedFriend
                        }
                        cacheUser.friends = NSSet(array: friendArray)
                        
                    }
                    
                    try? moc.save()
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
