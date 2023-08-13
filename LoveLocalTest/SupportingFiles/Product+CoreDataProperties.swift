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

    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var image: String?
    @NSManaged public var price: Double
    @NSManaged public var title: String?

}

extension Product : Identifiable {

}
