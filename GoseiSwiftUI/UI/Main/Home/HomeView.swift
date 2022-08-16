//
//  HomeView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            ProductCategorySlider(currentCategory: $viewModel.currentSliderCategory)
            
            promotionalProducts
            
            largeButton("CHECK ALL LATEST")
                .padding(.vertical, 30)
            
            categories
            
            largeButton("BROWSE ALL CATEGORIES")
                .padding(.vertical, 30)
        }
        .padding(.horizontal, 10)
        .removeNavigationBar()
    }
}

private extension HomeView {
    
    var promotionalProducts: some View {
        VStack(spacing: 0) {
            HStack {
                Text(Localizable.promotional_products.localized)
                    .font(.playfair(24, .bold))
                    .foregroundColor(Color.text)
                    .padding(.bottom, 20)
                
                Spacer()
            }
            
            LazyVGrid(columns: .two) {
                ForEach(viewModel.promotionalProducts) { product in
                    NavigationLink(isActive: $viewModel.productCoordinator.isRootVisible, destination: {
                        ProductView($viewModel.isProductRootVisible, viewModel: ProductViewModel(product: product))
                    }, label: {
                        PromotionalProductCard(product: product)
                    })
                    
                        .isDetailLink(false)
                        .buttonStyle(.plain)
                }
            }
        }
    }
    
    func largeButton(_ text: String, onTapped: EmptyCallback? = nil) -> some View {
        Text(text)
            .font(.workSans(18, .semiBold))
            .background(Color.background)
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(Color.background)
            .padding(2)
            .background(Color.text)
            .contentShape(Rectangle())
            .onTapGesture {
                onTapped?()
            }
    }
    
    var categories: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Shop by Categories")
                    .font(.playfair(24, .bold))
                    .foregroundColor(Color.text)
                    .padding(.bottom, 20)
                
                Spacer()
            }
            
            LazyVGrid(columns: .two) {
                ForEach(viewModel.promotionalCategories) { category in
                    ProductCategoryCard(category)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
