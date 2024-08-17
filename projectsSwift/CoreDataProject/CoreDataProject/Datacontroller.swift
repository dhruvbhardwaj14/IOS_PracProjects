//
//  Datacontroller.swift
//  BookWorm
//
//  Created by Dhruv Bhardwaj on 21/07/22.
//
import CoreData
import Foundation

class Datacontroller:ObservableObject{
    let container=NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
                return
            }

            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
