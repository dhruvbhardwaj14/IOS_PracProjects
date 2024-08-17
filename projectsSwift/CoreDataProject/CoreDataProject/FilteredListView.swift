//
//  FilteredListView.swift
//  CoreDataProject
//
//  Created by Dhruv Bhardwaj on 02/08/22.
//

import CoreData
import SwiftUI

struct FilteredListView<T:NSManagedObject,Content:View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    // this is our content closure; we'll call this once for each item in the list
    let content:(T) -> Content
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
           }
    }
    init(filterKey: String,filterValue:String,@ViewBuilder content: @escaping(T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey,filterValue))
        self.content=content
    }
}


