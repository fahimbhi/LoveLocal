//
//  Products.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import Foundation

struct Products : Codable {
    let products : [ProductModel]
}

struct ProductModel : Codable {
        let id : Int
        let title: String
        let price : Double
        let description: String
        let category : String
        let image : String
}
