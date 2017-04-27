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

struct PointOfInterest {
    
    enum PoiType: Int {
        case restaurant
        case museum
        case hotel
        
        var stringValue: String {
            switch self {
            case .restaurant:
                return "Restaurant"
            case .museum:
                return "Musée"
            case .hotel:
                return "Hotel"
            }
        }
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
    
    static var random: PointOfInterest {
        
        let random = arc4random_uniform(100)
        let typeRandom = arc4random_uniform(2)
        
        let type = PoiType(rawValue: Int(typeRandom))!
        let name = "\(type.stringValue) \(random)"
        let address = "\(random) rue des Randoms"
        
        let poi = PointOfInterest(name: name, address: address, type: type, latitude: 0, longitude: 0, phoneNumber: "0123456789", websiteURL: nil, wikipediaPageURL: nil, numberOfReviews: 0, stars: 0, myReview: 0)
        
        return poi
    }
}

extension PointOfInterest: Hashable {
    
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

extension Array where Element == String{
    func sortedAlphabetically() -> [String] {
        return self.sorted { (s1, s2) -> Bool in
            return s1 < s2
        }
    }
}
