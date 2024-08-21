//
//  ProductViewModel.swift
//  TestProject
//
//  Created by Mac  on 12.08.2024.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        loadMockData()
    }

    private func loadMockData() {
        self.products = [
            Product(name: "Мясо", rating: 4.8, country: "", price: 999.90, lastPrice: 1299.0, specialMark: "Удар по ценам", specialMarkColor: .red, reviewsCount: 16, imageName: "meat"),
            Product(name: "Мясо на шпажке", rating: 4.1, country: "Франция", price: 1199.89, lastPrice: 1499.0, specialMark: "", specialMarkColor: .blue, reviewsCount: 32, imageName: "anotherMeat"),
            Product(name: "Миндаль", rating: 4.1, country: "Азербайджан", price: 199.99, lastPrice: 199.0, specialMark: "Специальная цена",specialMarkColor: .green, reviewsCount: 54, imageName: "mindal"),
            Product(name: "Огурцы", rating: 5.0, country: "", price: 123.00, lastPrice: 150.23, specialMark: "Новинка", specialMarkColor: .yellow, reviewsCount: 23, imageName: "cucumber"),
            Product(name: "Мясо", rating: 3.2, country: "", price: 450.32, lastPrice: 670.23, specialMark: "", specialMarkColor: .purple, reviewsCount: 27, imageName: "meat 1"),
            Product(name: "Энергетик", rating: 4.4, country: "Россия", price: 129.2, lastPrice: 198.2, specialMark: "Акция", specialMarkColor: .red, reviewsCount: 12, imageName: "energy")
        ]
    }
}

