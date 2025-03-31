import SwiftUI

struct FriendsListView: View {
    
    var name: String
    var friends: [Friends]
    
    var body: some View {
        Text("\(name)'s friends:")
            .font(.headline)
            .fontWidth(.expanded)
            .padding()
        Text("\(friends.count) friends")
            .font(.footnote)
            .fontWeight(.bold)
            .fontDesign(.rounded)
            .padding(.horizontal, 10)
            .background(.gray.opacity(0.25))
            .clipShape(.rect(cornerRadius: 10))
        List(friends, id: \.id) { friend in
            VStack(alignment: .leading) {
                Text(friend.name)
                    .font(.headline)
            }
        }
    }
}
