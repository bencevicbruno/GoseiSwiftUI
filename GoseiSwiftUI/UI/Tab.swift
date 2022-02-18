//
//  Tab.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 18.02.2022..
//

import SwiftUI

enum Tab: Identifiable, CaseIterable {
    case home
    case search
    case wishlist
    case cart
    
    var id: Self {
        self
    }
    
    var title: String {
        "\(self)".capitalized
    }
    
    var image: Image {
        switch(self) {
        case .home:
            return Image(.icon_tab_home)
        case .search:
            return Image(.icon_tab_search)
        case .wishlist:
            return Image(.icon_tab_wishlist)
        case .cart:
            return Image(.icon_tab_cart)
        }
    }
}
