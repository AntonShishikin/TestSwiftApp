//
//  UnitSwitcher.swift
//  TestProject
//
//  Created by Mac  on 15.08.2024.
//

import Foundation
import SwiftUI

struct UnitSwitcher: View {
    @Binding var selectedUnit: String

    var body: some View {
        HStack {
            Button(action: {
                selectedUnit = "Шт"
            }) {
                Text("Шт")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(selectedUnit == "Шт" ? .black : .gray)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(selectedUnit == "Шт" ? Color.white : Color.gray.opacity(0.2))
                    .cornerRadius(5)
            }
            
            Button(action: {
                selectedUnit = "Кг"
            }) {
                Text("Кг")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(selectedUnit == "Кг" ? .black : .gray)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(selectedUnit == "Кг" ? Color.white : Color.gray.opacity(0.2))
                    .cornerRadius(5)
            }
        }
        .frame(width: 168, height: 20)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct UnitSwitcher_Previews: PreviewProvider {
    @State static var unit: String = "Кг"
    
    static var previews: some View {
        UnitSwitcher(selectedUnit: $unit)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
