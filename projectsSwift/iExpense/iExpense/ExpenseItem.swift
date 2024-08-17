//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Dhruv Bhardwaj on 02/07/22.
//

import Foundation
struct ExpenseItem :Identifiable,Codable{//this type can be identified uniquely one requirement is that it must contain a unique id,ADDING THIS GIVE US AN ADVANTAGE THAT NOT NEED TO USE id IN FOREACH anymore for this struct
    //Codable is added to let us archive encode the changes of expenses usin JSON encoder
    var id=UUID()//universal unique identity //changed from let to var to make it variable
    let name:String
    let type:String
    let amount:Double
    
}
