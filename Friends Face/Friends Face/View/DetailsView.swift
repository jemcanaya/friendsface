import SwiftUI
import SwiftData

struct DetailsView: View {
    var user: User
    
    let layout =
    [
        GridItem(.fixed(30))
    ]
    
    var body: some View {
        
        VStack(spacing: 15) {
            Text(user.name)
                .font(.largeTitle)
                .fontWidth(.expanded)
                .fontWeight(.bold)
            HStack {
                Text(user.isActive ? "Online" : "Offline")
                    .font(.footnote)
                    .fontDesign(.rounded)
                    .padding(.leading, 10)
                Image(systemName: "circle.fill")
                    .font(.system(size: 10))
                    .foregroundStyle(user.isActive ? .green : .gray)
                    .padding(.trailing, 10)
            }
            .background(.gray.opacity(0.25))
            .clipShape(.rect(cornerRadius: 10))
            
            VStack(spacing: 10) {
                ScrollView(.horizontal) {
                    LazyHGrid(rows: layout) {
                        ForEach(user.tags, id: \.self) {
                            Text($0)
                                .font(.footnote)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 10)
                                .background(.black)
                                .foregroundStyle(.white)
                                .clipShape(.rect(cornerRadius: 15))
                        }
                    }
                    .padding(.horizontal)
                }
                .scrollIndicators(.hidden)
                
                NavigationLink {
                    FriendsListView(name: user.name, friends: user.friends)
                } label: {
                    HStack {
                        Text("\(user.friends.count) Friend\(user.friends.count > 1 ? "s" : "" )")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                            .font(.subheadline)
                    }
                    
                }
            }
            
        }
        .padding(.vertical)
        
        List {
            Section("About Me") {
                Text("\(user.about)")
            }
            
            Section("Age") {
                Text("\(user.age)")
            }
            
            Section("Company") {
                Text("\(user.company)")
            }
            
            Section("Email") {
                Text("\(user.email)")
            }
            
            Section("Address") {
                Text("\(user.address)")
            }
            
            Text("Date Registered: \(user.formattedDate)")
                .font(.footnote)
                .foregroundStyle(.gray.opacity(0.75))
        }
    }
    
}
