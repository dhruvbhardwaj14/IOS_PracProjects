//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Dhruv Bhardwaj on 25/07/22.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController=Datacontroller()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
