//
//  HamburgerMenuItem.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 16.02.2022..
//

import Foundation

enum HamburgerMenuItem: Int, CaseIterable {
    case home = 0
    case categories = 1
    case search = 2
    case wishlist = 3
    case cart = 4
    case account = 5
    case signOut = 6
    case logIn = 7
    
    var title: String {
        self == .signOut ? "Sign Out" : self == .logIn ? "Log In" : "\(self)".capitalized
    }
    
    var index: Int {
        self.rawValue
    }
}

extension HamburgerMenuItem: Identifiable {
    
    var id: Self {
        self
    }
}
