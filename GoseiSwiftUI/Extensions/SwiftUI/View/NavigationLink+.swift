//
//  NavigationLink+.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 18.02.2022..
//

import Foundation
import SwiftUI

extension NavigationLink where Label == EmptyView {
    init(destination: Destination, isActive: Binding<Bool>) {
        self.init(destination: destination, isActive: isActive, label: EmptyView.init)
    }
}
