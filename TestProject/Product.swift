//
//  Product.swift
//  TestProject
//
//  Created by Mac  on 12.08.2024.
//

import Foundation

struct Product: Identifiable{
    let id: UUID = UUID()
    let name: String
    let rating: Double
    let country: String
    let price: Double
    let lastPrice: Double
    let specialMark: String
    let imageName: String
}

