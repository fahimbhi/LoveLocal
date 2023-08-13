//
//  StoreDetailsViewModel.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 13/08/23.
//

import Foundation
import CoreData

class StoreDetailsViewModel {
    
    let networkManager = NetworkManager()
    let coreDataManager = CoreDataManager()
    var productData : [ProductModel]?
    
    var shopProduct : Observable<[Product]> = Observable([])
    
    func load() {
        getProducts()
    }
    
    func getProducts() {
        networkManager.getData(completion: { products in
            self.productData = products
            if let products = products {
                self.saveItems(items: products)
            }
        })
    }
    
    func saveItems(items : [ProductModel]) {
        coreDataManager.saveData(items: items)
        self.shopProduct.value = coreDataManager.retrieveData()
    }
    
    func searchProduct(_ searchString : String) {
        if !searchString.isEmpty {
            self.shopProduct.value = coreDataManager.filterItems(searchString)
        }else {
            self.shopProduct.value = coreDataManager.retrieveData()
        }
    }
}
