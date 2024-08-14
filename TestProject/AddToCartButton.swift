//
//  AddToCartButton.swift
//  TestProject
//
//  Created by Mac  on 15.08.2024.
//

import Foundation
import SwiftUI

struct AddToCartButton: View {
    @Binding var quantity: Double
    var pricePerUnit: Double
    @Binding var selectedUnit: String
    
    var body: some View {
        HStack {
            Button(action: {
                if quantity > 0.1 {
                    quantity -= 0.1
                }
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.green)
                    .cornerRadius(15)
            }
            
            Spacer()
            
            VStack(spacing: 0) {
                Text("\(quantity, specifier: "%.1f") \(selectedUnit)")
                    .font(.headline)
                    .foregroundColor(.white)
                Text("~\(quantity * pricePerUnit, specifier: "%.2f") ₽")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color.green)
            .cornerRadius(15)
            
            Spacer()
            
            Button(action: {
                quantity += 0.1
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.green)
                    .cornerRadius(15)
            }
        }
        .frame(width: 150, height: 50)
        .padding(8)
    }
}

struct AddToCartButton_Previews: PreviewProvider {
    @State static var quantity: Double = 0.1
    @State static var unit: String = "Кг"
    
    static var previews: some View {
        AddToCartButton(quantity: $quantity, pricePerUnit: 5.92, selectedUnit: $unit)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
