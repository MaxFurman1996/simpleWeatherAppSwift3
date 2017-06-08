//
//  Location.swift
//  rainy
//
//  Created by Max Furman on 5/29/17.
//  Copyright © 2017 Max Furman. All rights reserved.
//

import CoreLocation

class Location{
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
    
}
