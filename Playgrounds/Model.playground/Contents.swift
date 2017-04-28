//: Playground - noun: a place where people can play

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

class Directory {

    private var poiSet: Set<PointOfInterest> = []
    
    var allPois: [PointOfInterest] {
        return poiSet.sorted() { (p1, p2) -> Bool in
            if p1.name < p2.name {
                return true
            }
            return false
        }
    }
    
    func add(_ poi: PointOfInterest) -> Bool {
        return poiSet.insert(poi).inserted
    }
    
    func remove(_ poi: PointOfInterest) -> PointOfInterest? {
        return poiSet.remove(poi)
    }
}

