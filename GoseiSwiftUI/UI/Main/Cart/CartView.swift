//
//  CartView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct CartView: View {
    var body: some View {
        Text("Hello, Cart!")
            .frame(size: .infinity)
            .removeNavigationBar()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
