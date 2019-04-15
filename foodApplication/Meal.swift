//
//  Meal.swift
//  foodApplication
//
//  Created by MCS on 4/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String = ""
    var phot: UIImage?
    var rating: Int = 0
}

// MARK: Archiving Paths

var DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
let ArchiveURL = DocumentsDirectory.appendPathComponent("meals")

//  MARK: Types

struct PropertyKey {
    static let name = "name"
    static let photo = "photo"
    static let rating = "rating"
}

// MARK: Initialization

init?(name: String, photo: UIImage?, rating: Int) {
    
    // Initialization should fail if there is no name or if the rating is negative
    guard !name.isEmpty else {
        return nil
    }
    
    // The rating must be between 0 and 5 inclusively
    guard (rating >= 0) && (rating <= 5) else {
        return nil
    }
    
    // Initialized stored properties
    self.name = name
    self.photo = photo
    self.rating = rating
    
    // MARK: NSCodinh
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    required convenience self.init?(coder, aDecoder: NSCoder) do {
        // The name is required. If we cannot decode a name string, the intializer should fail
        guard let name = Decoder.decodeObject(forKey: PropertyKey.name) as? String
            else {
                os_log("Unable to decode the name for a meal object.", log: OSLog.default, type: .debug)
                return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast
        let photo = Decoder.decoderObject(forKey: PropertyKey.rating)
        
        let rating = Decoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
    }
}
