//
//  BandObject.swift
//  Book My Band
//
//  Created by Matt Huston on 9/21/18.
//  Copyright © 2018 Matt Huston. All rights reserved.
//

import UIKit

class Bands: Codable {
    let Bands: [BandObject]
    
    init(Bands: [BandObject]) {
        self.Bands = Bands
    }
}

class BandObject: Codable {
    let band_name: String
    let genre: String
    let website: String
    let location: String
    let date: String
    let message: String
    
    init(band_name: String, genre: String, website: String, location: String, date: String, message: String) {
        self.band_name = band_name
        self.genre = genre
        self.website = website
        self.location = location
        self.date = date
        self.message = message
    }
}
