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
                    NavigationLink {
                        UserDetailView(user: user)
                    } label: {
                        HStack {
                            UserView(isActive: user.isActive)
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .foregroundColor(.primary)
                                    .font(.headline)
                                
                                Text(user.email)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Friendface")
        }
        .task {
            await loadData()
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