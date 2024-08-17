//
//  Datacontroller.swift
//  BookWorm
//
//  Created by Dhruv Bhardwaj on 21/07/22.
//
import CoreData
import Foundation

class Datacontroller:ObservableObject{
    let container=NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
