//
//  NetworkManager.swift
//  LoveLocalTest
//
//  Created by Faheem Rahman on 12/08/23.
//

import Foundation

public let demoAPI = "https://fakestoreapi.com/products/"

class NetworkManager {
    func getData(completion: @escaping ([ProductModel]?) -> Void) {
        guard let url = URL(string: demoAPI) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data {
                let products = try? JSONDecoder().decode([ProductModel].self, from: data)
                completion(products)
            }else {
                completion(nil)
            }
        }
        task.resume()
    }
}

