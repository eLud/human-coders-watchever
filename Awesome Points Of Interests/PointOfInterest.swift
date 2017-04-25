//
//  PointOfInterest.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 25/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

#if os(iOS) || os(OSX)
import CoreLocation
#endif

struct PointOfInterest: Hashable {
    
    enum PoiType {
        case restaurant
        case museum
        case hotel
    }
    
    let name: String
    let address: String
    let type: PoiType
    
    var latitude: Double
    var longitude: Double
    
    //Instruction préprocesseur
    #if os(iOS) || os(OSX)
    
    //Computed property
    // O(1)
    var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        set {
            latitude = newValue.latitude
            longitude = newValue.longitude
        }
    }
    #endif
    
    var phoneNumber: String
    var websiteURL: URL?
    var wikipediaPageURL: URL?
    
    var numberOfReviews: Int
    var stars: Float
    var myReview: Float
    
    var hashValue: Int {
        return name.hashValue ^ address.hashValue
    }
    
    static func ==(lhs: PointOfInterest, rhs: PointOfInterest) -> Bool {
        if lhs.name == rhs.name && lhs.address == rhs.address {
            return true
        }
        
        return false
    }
    
}
