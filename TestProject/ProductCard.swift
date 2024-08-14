import SwiftUI

struct ProductCard: View {
    var product: Product
    @State private var isFavorite: Bool = false
    @State private var quantity: Double = 0.1
    @State private var selectedUnit: String = "Кг"
    @State private var isInCart: Bool = false

    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 8) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 168)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 2) {
                        Label("", systemImage: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.headline)
                        Text("\(product.rating, specifier: "%.1f")")
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    
                    Text(product.name)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(Color("basicFontColor"))
                        .lineLimit(1)
                    
                    Text(product.country)
                        .font(.system(size: 9, weight: .regular))
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        VStack(alignment: .leading) {
                            let priceString = String(format: "%.2f", product.price)
                            let priceComponents = priceString.split(separator: ".")
                            let rubs = String(priceComponents[0])
                            let kops = String(priceComponents[1])
                            HStack(alignment: .top, spacing: 0) {
                                Text(rubs)
                                    .font(.system(size: 18, weight: .bold))
                                
                                Text(kops)
                                    .font(.system(size: 14, weight: .bold))
                                    .baselineOffset(8)
                                
                                Text(" ₽/кг")
                                    .font(.system(size: 12, weight: .regular))
                                    .baselineOffset(8)
                            }
                            .foregroundColor(.black)
                            
                            Text("\(product.lastPrice, specifier: "%.2f") ₽")
                                .strikethrough(true, color: .gray)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .padding(.top, -17)
                            
                        }
                        Spacer()
                        
                        if isInCart {
                            VStack(spacing: 0){
                                UnitSwitcher(selectedUnit: $selectedUnit)
                                
                                AddToCartButton(quantity: $quantity, pricePerUnit: product.price, selectedUnit: $selectedUnit)
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
                                        
                                        Image(systemName: "cart.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                    }
                                }
                                .padding(5)
                            }
                            .frame(height: 50)
                        }
                    }
                }
                .padding([.leading, .bottom], 8)
            }
            .background(Color.white)
            .cornerRadius(21)
            .shadow(radius: 5)
            
            if !product.specialMark.isEmpty {
                Text(product.specialMark)
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.red)
                    .cornerRadius(10, corners: [.bottomRight, .topLeft])
                    .zIndex(1)
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .foregroundColor(isFavorite ? .red : .gray)
                            .frame(width: 20, height: 20)
                            .padding(8)
                    }
                }
                Spacer()
            }
            .padding(.trailing, 8)
            .padding(.top, 8)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ProductListView: View {
    @ObservedObject var viewModel = ProductViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 28) {
                    ForEach(viewModel.products) { product in
                        ProductCard(product: product)
                            .frame(width: 168, height: 278)
                    }
                }
                .padding(EdgeInsets(top: 25, leading: 10, bottom: 10, trailing: 15))
                
            }
            .background(Color(.systemGroupedBackground))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Действие для открытия меню
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(Color("lightGray"))
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            
                            Image("menupanel")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }
                    }
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
