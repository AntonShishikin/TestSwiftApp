import Foundation
import SwiftUI

struct AddToCartButton: View {
    var product: Product
    @Binding var quantity: Double
    var pricePerUnit: Double
    @Binding var selectedUnit: String
    @Binding var isInCart: Bool
    @EnvironmentObject var cart: Cart
    
    @Binding var showToast: Bool
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Button(action: {
                if quantity > 0.1 {
                    quantity -= 0.1
                    updateCart()
                } else if quantity <= 0.1 {
                    withAnimation {
                        isInCart = false
                    }
                }
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .background(Color.green)
                    .cornerRadius(15)
                    .zIndex(1)
            }

            Button(action: {
                cart.addToCart(product: product, quantity: quantity)
                showToastMessage()
            }) {
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
                .zIndex(0)
            }
            
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
        .background(Rectangle()
                        .fill(Color.green)
                        .frame(width: 160, height: 36)
                        .cornerRadius(40))
        .frame(minWidth: 160, maxHeight: 36)
        .padding(0)
    }
    
    
    
    private func showToastMessage() {
            withAnimation {
                showToast = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showToast = false
                }
            }
        }
    
    private func updateCart() {
        if isInCart {
            cart.updateCart(product: product, quantity: quantity)
        }
    }
    
    private func openCart() {
        CartView()
        print("Открыть экран корзины")
    }
}

//struct AddToCartButton_Previews: PreviewProvider {
//    @State static var quantity: Double = 0.1
//    @State static var unit: String = "Кг"
//    @State static var isInCart: Bool = true
//    
//    static var previews: some View {
//        AddToCartButton(product: Product.example(), quantity: $quantity, pricePerUnit: 5.92, selectedUnit: $unit, isInCart: $isInCart)
//            .previewLayout(.sizeThatFits)
//            .padding()
//            .environmentObject(Cart())  // Пример корзины для предварительного просмотра
//    }
//}
