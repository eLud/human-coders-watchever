//
//  Directory.swift
//  Awesome Points Of Interests
//
//  Created by Ludovic Ollagnier on 25/04/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation
import CoreData

class Directory {
    
    static let instance = Directory()
    
    private init() {
    }
    
    var allPois: [PointOfInterest] {
        
        let context = CoreDataStack.defaultStack.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<POI> = POI.fetchRequest()
        guard let results = try? context.fetch(fetchRequest) else { return [] }
        
        return []
    }
    
    func add(_ poi: PointOfInterest) -> Bool {
        
        let context = CoreDataStack.defaultStack.persistentContainer.viewContext
        
        //Créer un objet CD
        let coreDataPOI = POI(context: context)
        coreDataPOI.address = poi.address
        coreDataPOI.name = poi.name
        
//        let country = Country(context: context)
//        country.name = "USA"
//        
//        coreDataPOI.country = country
        CoreDataStack.defaultStack.saveContext()
        
        let fetchRequest: NSFetchRequest<POI> = POI.fetchRequest()
        guard let results = try? context.fetch(fetchRequest) else { return false }
        print(results)
        
        //Gestion d'erreur avec try!
//        let results = try! context.fetch(fetchRequest)
        
        //Gestion d'erreur avec do-catch
//        do {
//            let results = try context.fetch(fetchRequest)
//        } catch {
//            print(error)
//        }
        
        return true
    }
    
    func remove(_ poi: PointOfInterest) -> PointOfInterest? {
        return nil
    }
}
