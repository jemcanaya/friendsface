//
//  MainView.swift
//  Friends Face
//
//  Created by Jemerson Canaya on 3/31/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users : [User]
    
    var body: some View {
        NavigationStack {
            Text("Welcome to Friends Face 😄")
                .font(.title)
                .fontWidth(.expanded)
                .fontWeight(.bold)
                .padding()
            Text("Here are your friends:")
                .font(.subheadline)
                .fontWidth(.expanded)
                .padding()
            List(users, id: \.id) { user in
                
                NavigationLink {
                    DetailsView(user: user)
                } label: {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                            .fontWidth(.expanded)
                        Text(user.address)
                            .font(.subheadline)
                    }
                }
                
                
            }.task {
                if users.isEmpty {
                    await loadData()
                }
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
                print("Number of Users: \(decodedResponse.count)")
                
                for decoded in decodedResponse {
                    modelContext.insert(decoded)
                }

            } else {
                print("Decode Fail")
            }
        } catch {
            print("Invalid data")
        }
    }
    
}
