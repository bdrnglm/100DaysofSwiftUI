//
//  ContentView.swift
//  Friendface
//
//  Created by Badran on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    let firstName = user.name.split(separator: " ")[0]
                    let lastName = user.name.split(separator: " ")[1]

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
            
            print("OUIOUIOUIt")
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
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
