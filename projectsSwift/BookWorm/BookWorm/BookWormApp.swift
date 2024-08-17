//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Dhruv Bhardwaj on 21/07/22.
//

import SwiftUI

@main
struct BookWormApp: App {
    @StateObject private var dataController=Datacontroller()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
