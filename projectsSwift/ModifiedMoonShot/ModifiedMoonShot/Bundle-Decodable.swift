//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by Dhruv Bhardwaj on 04/07/22.
//

import Foundation

extension Bundle {
    func decode<T:Codable>(_ file: String) -> /*[String: Astronaut]*/ T {//<T> placeholder makes the function generic for all datatypes and <T> means type
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()
        //telling decoder whenever encounter a date use this format for dates
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {//it should decode T.self instead of [String:Astronaut]
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}
