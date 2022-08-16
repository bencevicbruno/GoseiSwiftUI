//
//  SearchView.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        Text("Hello, Search!")
            .frame(size: .infinity)
            .removeNavigationBar()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
