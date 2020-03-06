//
//  User.swift
//  Bechir_FinalIos2
//
//  Created by Mobile Apps on 2020-02-19.
//  Copyright © 2020 Bechir Mihoub. All rights reserved.
//

import Foundation
struct User: Codable {
    let title: String
    let link: URL
    let description: String
    let modified: String
    let generator: String
    var items: [Item]
}

struct Item: Codable {
    let title: String
    let link: URL
    let date_taken: String
    let author: String
    let author_id: String
    let published: String
    let media: NestedO


static func loadItems() -> [Item]? {
        //return nil
        guard let codedItems = try? Data(contentsOf: ArchiveURL) else { return nil }
              
              let propertyListDecoder = PropertyListDecoder()
              
              return try? propertyListDecoder.decode(Array<Item>.self, from: codedItems)
    }
    
static func saveItems(_ flicker: [Item]) {
        let propertyListEncoder = PropertyListEncoder()
        
        let codedItems = try? propertyListEncoder.encode(flicker)
        
        try? codedItems?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
static let ArchiveURL = DocumentsDirectory.appendingPathComponent("flicker").appendingPathExtension("plist")
    
}

struct NestedO: Codable {
    let m: URL
}





