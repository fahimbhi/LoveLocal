//
//  Product+CoreDataProperties.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//
//

import Foundation
import CoreData


extension Product {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }
    
    @nonobjc public class func filteredFetchRequest(_ searchString : String) -> NSFetchRequest<Product> {
        var predicateList = [NSPredicate]()
        let titlePredicate = NSPredicate(format: "title contains[c] %@", searchString)
        let descPredicate = NSPredicate(format: "desc contains[c] %@", searchString)
        let fetchReuest = NSFetchRequest<Product>(entityName: "Product")
        fetchReuest.fetchBatchSize = 20
        let orCompoundPredicate = NSCompoundPredicate(type: .or, subpredicates: [titlePredicate, descPredicate])
        predicateList.append(orCompoundPredicate)
        fetchReuest.predicate = orCompoundPredicate
        return fetchReuest
    }
    
    
    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var image: String?
    @NSManaged public var price: Double
    @NSManaged public var title: String?
    
}

extension Product : Identifiable {
    
}
