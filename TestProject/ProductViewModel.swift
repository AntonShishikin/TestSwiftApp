//
//  ProductViewModel.swift
//  TestProject
//
//  Created by Mac  on 12.08.2024.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [Product] = []

    init() {
        loadMockData()
    }

    private func loadMockData() {
        self.products = [
            Product(name: "Мясо", rating: 4.8, country: "", price: 999.90, lastPrice: 1299.0, specialMark: "Удар по ценам", imageName: "meat"),
            Product(name: "Мясо на шпашке", rating: 4.1, country: "Франция", price: 1199.89, lastPrice: 1499.0, specialMark: "", imageName: "anotherMeat"),
            Product(name: "Часы", rating: 4.1, country: "Азербайджан", price: 199.99, lastPrice: 199.0, specialMark: "Специальная цена", imageName: "watch")
        ]
    }
}

