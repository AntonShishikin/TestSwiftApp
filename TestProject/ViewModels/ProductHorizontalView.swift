//
//  ProductHorizontalView.swift
//  TestProject
//
//  Created by Mac  on 21.08.2024.
//

import Foundation
import SwiftUI

struct ProductHorizontalView: View {
    @ObservedObject var viewModel = ProductViewModel()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.products) { product in
                    ProductCard(product: product)
                        .frame(width: 168, height: 278)
                }
            }
            .padding(.horizontal, 10)
        }
        .background(Color(.systemGroupedBackground))
    }
}
