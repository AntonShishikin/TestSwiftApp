//
//  Product.swift
//  TestProject
//
//  Created by Mac  on 12.08.2024.
//

import Foundation
import SwiftUI

struct Product: Identifiable{
    let id: UUID = UUID()
    let name: String
    let rating: Double
    let country: String
    let price: Double
    let lastPrice: Double
    let specialMark: String
    var specialMarkColor: Color
    let reviewsCount: Int
    let imageName: String
}

