//
//  ProductCoordinator.swift
//  GoseiSwiftUI
//
//  Created by Bruno Benčević on 21.02.2022..
//

import Foundation

final class ProductCoordinator: ObservableObject {
    @Published var isRootVisible = false
    
    init() {
        
    }
    
    func pop() {
        isRootVisible = false
    }
}
