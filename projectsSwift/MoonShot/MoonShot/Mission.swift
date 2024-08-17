//
//  Mission.swift
//  MoonShot
//
//  Created by Dhruv Bhardwaj on 04/07/22.
//

import Foundation

struct Mission: Codable, Identifiable {//struct inside a struct can make it run inside and for that struct
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: /*String*/ Date?//used date to decode it as a date instead of a string
    let crew: [CrewRole]
    let description: String
    
        //for having all our images and  display data in one place
    var displayName: String {
        "Apollo \(id)"
    }
    var image: String {
        "apollo\(id)"
    }
    
    //get a date automatically convert to a string here only by using the datedocoder in bundle
    var formattedLaunchDate:String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
