//
//  Category.swift
//  ToDoTheList
//
//  Created by Dhruv Bhardwaj on 06/01/23.
//

import Foundation
import RealmSwift
class Category:Object{
    @objc dynamic var name:String=""
    @objc dynamic var colour:String=""
    let items=List<Item>()
}
