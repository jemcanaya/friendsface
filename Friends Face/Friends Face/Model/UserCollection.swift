import SwiftUI

struct UserCollection: Codable {
    
    var id: String = ""
    var isActive: Bool = false
    var name: String = ""
    var age: Int = 0
    var company: String = ""
    var email: String = ""
    var address: String = ""
    var about: String = ""
    var registered: Date? = Date()
    var tags: [String] = [""]
    var friends: [Friends] = [Friends]()
    
}


