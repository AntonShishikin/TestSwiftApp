//
//  CartView.swift
//  TestProject
//
//  Created by Mac  on 21.08.2024.
//

import Foundation
import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: Cart

    
    var body: some View {
        NavigationView{
            VStack{
                if cart.items.isEmpty{
                    Text("Корзина пуста")
                        .font(.largeTitle)
                        .padding()
                }else{
                    List {
                        ForEach(cart.items) { item in
                            HStack {
                                Text(item.product.name)
                                Spacer()
                                Text("Количество: \(item.quantity)")
                                Text(String(format: "%.2f ₽", item.product.price * Double(item.quantity)))
                                    .bold()
                            }
                        }
                        .onDelete(perform: delete)
                    }
                    
                    HStack {
                        Text("Итого:")
                            .font(.title2)
                        Spacer()
                        Text(String(format: "%.2f ₽", cart.totalAmount()))
                            .font(.title2)
                            .bold()
                    }
                    .padding()
                    
                    Button(action: {
                            cart.clearCart()
                        }) {
                            Text("Очистить корзину")
                                .foregroundColor(.red)
                        }
                        .padding(.bottom)
                }
            }
            .navigationTitle("Корзина")
        }
    }
    
    func delete(at offsets: IndexSet) {
        cart.items.remove(atOffsets: offsets)
    }
}
