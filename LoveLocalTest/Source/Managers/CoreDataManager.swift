//
//  CoreDataManager.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData(items : [ProductModel]) {
        for item in items {
            do {
                // To stop duplicate items from storing
                let request : NSFetchRequest<Product> = Product.fetchRequest()
                request.predicate = NSPredicate(format: "id == %d", Int32(item.id))
                let numberOfRecords = try context.count(for: request)
                if numberOfRecords == 0 {
                    let product = Product(context: self.context)
                    product.title = item.title
                    product.desc = item.description
                    product.image = item.image
                    product.price = item.price
                    product.id = Int32(item.id)
                    do {
                        try context.save()
                        print("Success")
                    } catch {
                        print("Error saving: \(error)")
                    }
                }
            } catch {
                print("Error saving context \(error)")
            }
        }
    }
    
    func retrieveData() -> [Product] {
        do {
            let products = try self.context.fetch(Product.fetchRequest())
            return products
        }catch {
            return []
        }
    }
    
    func filterItems(_ searchString : String) -> [Product] {
        do {
            let products = try self.context.fetch(Product.filteredFetchRequest(searchString))
            return products
                                                  
        }catch {
            return []
        }
    }
}
