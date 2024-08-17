//
//  Item.swift
//  ToDoTheList
//
//  Created by Dhruv Bhardwaj on 06/01/23.
//

import Foundation
import RealmSwift
class Item:Object{
    @objc dynamic var title:String=""
    @objc dynamic var done:Bool=false
    @objc dynamic var dateCreated:Date?
    var parentCategory=LinkingObjects(fromType:Category.self,property: "items")
}
