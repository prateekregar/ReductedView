//
//  Product.swift
//  Reducted View
//
//  Created by Prateek on 03/09/23.
//

import Foundation

struct ProductResponse: Codable {
    var products: [Product]
    var total: Int
    var skip: Int
    var limit: Int
    
    /// No need of coding key as we are using same variable names as key names
//    enum CodingKeys: String, CodingKey {
//        case products = "products"
//        case total = "total"
//        case skip = "skip"
//        case limit = "limit"
//    }
    
}

struct Product: Codable, Identifiable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
    
#if DEBUG
    static let dummy = Product(id: 5, title: "Iphone", description: "Mobile", price: 15.0, discountPercentage: 30.5, rating: 3, stock: 6, brand: "Apple", category: "some", thumbnail: "https://i.dummyjson.com/data/products/30/thumbnail.jpg", images: ["https://i.dummyjson.com/data/products/30/thumbnail.jpg"])
#endif
}
