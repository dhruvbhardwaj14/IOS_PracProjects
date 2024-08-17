//
//  Prospect.swift
//  HotProspects
//
//  Created by Dhruv Bhardwaj on 16/09/22.
//

import Foundation

class Prospect:Identifiable,Codable{
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}
@MainActor class Prospects:ObservableObject{
    @Published private(set) var people:[Prospect]
    let savekey="SavedData"
    init() {
        if let data = UserDefaults.standard.data(forKey: savekey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                people = decoded
                return
            }
        }

        people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: savekey)
        }
    }
    func add(_ prospect:Prospect){
        people.append(prospect)
        save()
    }
    func toggle(_ propsect:Prospect){
        objectWillChange.send()
        propsect.isContacted.toggle()
        save()
    }
}
