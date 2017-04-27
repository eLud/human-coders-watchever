//
//  Directory.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 25/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

class Directory {
    
    static let instance = Directory()
    
    private var poiSet: Set<PointOfInterest>
    
    private init() {
        poiSet = [PointOfInterest.random, PointOfInterest.random, PointOfInterest.random]
        
    }
    
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
