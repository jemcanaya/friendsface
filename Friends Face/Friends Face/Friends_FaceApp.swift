//
//  Friends_FaceApp.swift
//  Friends Face
//
//  Created by Jemerson Canaya on 3/31/25.
//

import SwiftUI
import SwiftData

@main
struct Friends_FaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
