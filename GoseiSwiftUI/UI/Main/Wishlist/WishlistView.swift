//
//  WishlistView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        Text("Hello, Wishlist!")
            .frame(size: .infinity)
            .removeNavigationBar()
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView()
    }
}
