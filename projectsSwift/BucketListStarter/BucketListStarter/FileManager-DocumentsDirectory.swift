//
//  FileManager-DocumentsDirectory.swift
//  BucketListStarter
//
//  Created by Dhruv Bhardwaj on 20/02/23.
//

import Foundation
extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
