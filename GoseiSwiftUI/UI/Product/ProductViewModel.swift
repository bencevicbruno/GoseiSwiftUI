//
//  ProductViewModel.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import Foundation
import SwiftUI

final class ProductViewModel: ObservableObject {
    
    @Published var currentTab: Tab = .description
    
    var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    func switchToTab(_ tab: Tab) {
        withAnimation {
            currentTab = tab
        }
    }
}

// MARK: - Interaction
extension ProductViewModel {
    
    func addToCardTapped() {
        print("Added product to cart.")
    }
}

extension ProductViewModel {
    
    enum Tab: Hashable {
        case description
        case shippingInfo
        case paymentOptions
    }
}
