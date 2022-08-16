//
//  HomeViewModel.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var currentSliderCategory: ProductCategory = .kitchenAppliances
    
    var onGoToProduct: ((Product) -> Void)?
    
    var promotionalProducts: [Product]
    var promotionalCategories: [ProductCategory]
    
    @Published var productCoordinator = ProductCoordinator()
    
    @Published var isProductRootVisible = false
    
    init() {
        promotionalProducts = [.test, .testFavorite, .testFavorite, .test]
        promotionalCategories = ProductCategory.allCases.shuffled().dropLast(2)
    }
}

// MARK: - Interaction
extension HomeViewModel {
    
    func productTapped(_ product: Product) {
        self.onGoToProduct?(product)
    }
}
