//
//  Cart.swift
//  TestProject
//
//  Created by Mac  on 21.08.2024.
//

import Foundation
import SwiftUI


struct CartItem: Identifiable {
    var id = UUID()
    var product: Product
    var quantity: Double
}

class Cart: ObservableObject {
    @Published var items: [CartItem] = []

    func addToCart(product: Product, quantity: Double) {
        do {
            try items.append(CartItem(product: product, quantity: quantity))
            print("Product added to cart successfully")
        } catch {
            print("Failed to add product to cart: \(error)")
        }
    }
    
    func removeFromCart(product: Product) {
           if let index = items.firstIndex(where: { $0.product.id == product.id }) {
               items.remove(at: index)
           }
       }
    
    func clearCart() {
        items.removeAll()
    }
    
    func updateCart(product: Product, quantity: Double) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            if quantity > 0 {
                items[index].quantity = quantity
            } else {
                removeFromCart(product: product)
            }
        }
    }
    
    func totalAmount() -> Double {
        return items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}

