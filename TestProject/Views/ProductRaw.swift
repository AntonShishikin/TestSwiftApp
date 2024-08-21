//
//  ProductRaw.swift
//  TestProject
//
//  Created by Mac  on 21.08.2024.
//

import Foundation
import SwiftUI

struct ProductRow: View {
    var product: Product
    @State private var isFavorite: Bool = false
    @State private var quantity: Double = 0.1
    @State private var selectedUnit: String = "Кг"
    @State private var isInCart: Bool = false
    @State private var showToast: Bool = false

    var body: some View {
        VStack(spacing: 0) {
            Divider()
            
            HStack {
                ZStack(alignment: .topLeading) {
                    Image(product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 144, height: 144)
                        .cornerRadius(10)
                    
                    if !product.specialMark.isEmpty {
                        Text(product.specialMark)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(product.specialMarkColor)
                            .cornerRadius(10)
                            .padding(.leading, 8)
                            .padding(.top, 8)
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Label("", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.headline)
                        Text("\(product.rating, specifier: "%.1f")")
                            .font(.footnote)
                            .foregroundColor(.black)
                        if !isInCart{
                            Text("| \(product.reviewsCount) отзывов")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    Text(product.name)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.black)
                        .lineLimit(2)
                    
                    HStack {
                        if !isInCart {
                            VStack(alignment: .leading){
                                Text("\(product.price, specifier: "%.2f") ₽/кг")
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                
                                Text("\(product.lastPrice, specifier: "%.2f") ₽")
                                    .strikethrough(true, color: .gray)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        }
                        
                        if isInCart {
                            VStack(spacing: 0) {
                                UnitSwitcher(selectedUnit: $selectedUnit)
                                    .padding(.bottom, 5)
                                    .padding(.leading, -4)
                                
                                AddToCartButton(product: product, quantity: $quantity, pricePerUnit: product.price, selectedUnit: $selectedUnit, isInCart: $isInCart, showToast: $showToast)
                                    .padding(.leading, -4)
                            }
                            .frame(height: 50)
                        } else {
                            HStack {
                                Spacer()
                                Button(action: {
                                    withAnimation {
                                        isInCart.toggle()
                                    }
                                }) {
                                    ZStack {
                                        Rectangle()
                                            .fill(Color.green)
                                            .frame(width: 50, height: 40)
                                            .cornerRadius(18)
                                        
                                        Image("minibasket")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            .padding(5)
                            .frame(height: 50)
                            .offset(x: 15)
                        }
                        
                        if showToast {
                            VStack {
                                Spacer()
                                Text("Товар добавлен в корзину")
                                    .font(.body)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.8))
                                    .cornerRadius(10)
                                    .transition(.slide)
                                    .zIndex(2)
                                    .padding(.bottom, 50)
                            }
                        }
                    }
                }
                Spacer()
                VStack (spacing: 2){
                    Button(action: {
                        // Логика для неизвестной кнопки
                    }) {
                        Image("checkimg")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                            .padding(.bottom, 4)
                    }
                    
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(isFavorite ? .red : .gray)
                    }
                }
                .offset(y: -30)
                .offset(x: -30)
            }
            .padding(4)
            .background(Color.white)
            .cornerRadius(0)
            
            Divider()
        }
    }
}
