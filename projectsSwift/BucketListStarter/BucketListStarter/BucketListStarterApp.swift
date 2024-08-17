//
//  BucketListStarterApp.swift
//  BucketListStarter
//
//  Created by Dhruv Bhardwaj on 20/02/23.
//

import SwiftUI

@main
struct BucketListStarterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
