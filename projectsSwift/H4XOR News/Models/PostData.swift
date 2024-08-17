//
//  PostData.swift
//  H4XOR News
//
//  Created by Dhruv Bhardwaj on 25/11/22.
//

import Foundation
struct Results:Decodable{
    let hits:[Post]
}
struct Post:Decodable,Identifiable{
    //to get a id variable
    var id:String{
        return objectID
    }
    let objectID:String
    let  points:Int
    let title: String
    let url:String?
    
}
